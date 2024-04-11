Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2A0CD1297
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 05:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B82B10E7FC;
	Thu, 11 Apr 2024 05:53:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CA210E193;
 Thu, 11 Apr 2024 05:53:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1898709278349262330=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Add_xe=5Fguc=5Fads=2E?=
 =?utf-8?q?c_to_uses=5Fgenerated=5Foob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Apr 2024 05:53:18 -0000
Message-ID: <171281479815.1338936.16966398572430375393@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410-drm-xe-fix-xe_guc_ads-using-xe_wa_oob-v1-1-441f2d8e5d83@kernel.org>
In-Reply-To: <20240410-drm-xe-fix-xe_guc_ads-using-xe_wa_oob-v1-1-441f2d8e5d83@kernel.org>
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

--===============1898709278349262330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add xe_guc_ads.c to uses_generated_oob
URL   : https://patchwork.freedesktop.org/series/132295/
State : failure

== Summary ==

CI Bug Log - changes from xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82_full -> xe-pw-132295v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132295v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132295v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132295v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr:
    - shard-adlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][3] +4 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unplug-rescan:
    - {shard-lnl-1}:      NOTRUN -> [DMESG-WARN][4] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-1/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - {shard-lnl-5}:      NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - {shard-lnl-5}:      NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl-2}:      NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - {shard-lnl-1}:      NOTRUN -> [SKIP][8] +22 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * {igt@kms_lease@page-flip-implicit-plane@pipe-c-edp-2}:
    - {shard-lnl-3}:      NOTRUN -> [DMESG-WARN][9] +8 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@kms_lease@page-flip-implicit-plane@pipe-c-edp-2.html

  * igt@kms_psr@psr-suspend@edp-1:
    - {shard-lnl-2}:      NOTRUN -> [DMESG-WARN][10] +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-2/igt@kms_psr@psr-suspend@edp-1.html

  * igt@xe_exec_basic@twice-basic-defer-bind:
    - {shard-lnl-3}:      NOTRUN -> [DMESG-FAIL][11] +3 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_exec_basic@twice-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:
    - {shard-lnl-3}:      NOTRUN -> [INCOMPLETE][12] +2 other tests incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - {shard-lnl-3}:      [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_gt_freq@throttle_basic_api:
    - {shard-lnl-3}:      NOTRUN -> [FAIL][15] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_gt_freq@throttle_basic_api.html

  
Known issues
------------

  Here are the changes found in xe-pw-132295v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - shard-adlp:         [PASS][16] -> [SKIP][17] ([Intel XE#1177] / [Intel XE#1201]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][18] ([Intel XE#1195]) +2 other tests incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#346])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +29 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-adlp:         [PASS][32] -> [SKIP][33] ([Intel XE#1201]) +45 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][35] ([Intel XE#1214]) +3 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-436/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][39] ([Intel XE#1191] / [Intel XE#1214])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#702])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#310])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1214])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][43] ([Intel XE#1214] / [i915#10142]) +3 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +17 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][45] -> [DMESG-WARN][46] ([Intel XE#1214])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#656]) +21 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1341])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#417])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][52] ([Intel XE#324])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7.html

  * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#616])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][55] ([Intel XE#361]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#1211])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1122] / [Intel XE#1201])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#294])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_rmfb@close-fd@pipe-b-dp-4.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#1174])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_sysfs_edid_timing.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#1201] / [Intel XE#455])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_vrr@negative-basic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#756]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1080]) +9 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1126] / [Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][69] -> [TIMEOUT][70] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#1259]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@xe_evict@evict-beng-threads-small.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][73] -> [TIMEOUT][74] ([Intel XE#1473] / [Intel XE#392])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][75] -> [TIMEOUT][76] ([Intel XE#1473])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-rebind:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][81] ([Intel XE#1069])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][82] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][83] ([Intel XE#1195] / [Intel XE#1358])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_pm@s3-basic.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][85] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][88] +12 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][89] ([Intel XE#616]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#771] / [Intel XE#899]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#1214]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-433/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-435/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-fd-rebind:
    - shard-dg2-set2:     [TIMEOUT][101] ([Intel XE#1261] / [Intel XE#1356]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-rebind.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-rebind.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - {shard-lnl-2}:      [FAIL][103] ([Intel XE#1440]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [ABORT][105] ([Intel XE#1538]) -> [INCOMPLETE][106] ([Intel XE#1195] / [Intel XE#1538])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [SKIP][107] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][108] ([Intel XE#1201]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-adlp:         [SKIP][109] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][110] ([Intel XE#1201])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][111] ([Intel XE#1231]) -> [SKIP][112] ([Intel XE#1201])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][113] ([Intel XE#1231]) -> [FAIL][114] ([Intel XE#1242])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][115] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][116] ([Intel XE#1177] / [Intel XE#1201])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [SKIP][117] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][118] ([Intel XE#1201])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][119] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][120] ([Intel XE#1201]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-adlp:         [SKIP][121] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][122] ([Intel XE#1201]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         [SKIP][123] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][124] ([Intel XE#1201])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][125] ([Intel XE#1162]) -> [FAIL][126] ([Intel XE#616]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         [SKIP][127] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][128] ([Intel XE#1201])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-adlp:         [SKIP][129] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][130] ([Intel XE#1177] / [Intel XE#1201])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#1235]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1235])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_flip@2x-plain-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-433/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [INCOMPLETE][133] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][134] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][135] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][136] ([Intel XE#1191] / [Intel XE#1214])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][137] ([Intel XE#1195]) -> [DMESG-WARN][138] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-adlp:         [SKIP][139] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][140] ([Intel XE#1201]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-adlp:         [SKIP][141] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][142] ([Intel XE#1201]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-adlp:         [ABORT][143] -> [INCOMPLETE][144] ([Intel XE#1195])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][145] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][146] ([Intel XE#1177] / [Intel XE#1201])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][147] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][148] ([Intel XE#1201]) +8 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         [SKIP][149] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][150] ([Intel XE#1201]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][151] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][152] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][154] ([Intel XE#1195] / [Intel XE#927])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][155] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][156] ([Intel XE#324]) +1 other test dmesg-fail
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][157] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][158] ([Intel XE#1177] / [Intel XE#1201])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-adlp:         [SKIP][159] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][160] ([Intel XE#1201]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_psr@fbc-pr-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][161] ([Intel XE#616]) -> [SKIP][162] ([Intel XE#1201])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         [FAIL][163] ([Intel XE#616]) -> [SKIP][164] ([Intel XE#1177] / [Intel XE#1201])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][165] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][166] ([Intel XE#1201])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][167] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][168] ([Intel XE#1177] / [Intel XE#1201])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [INCOMPLETE][169] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][170] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][171] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][172] ([Intel XE#1191] / [Intel XE#1214])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#1226]) +18 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_vrr@flipline.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         [SKIP][175] ([Intel XE#1062] / [Intel XE#1201]) -> [SKIP][176] ([Intel XE#1201])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_create@create-big-vram.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         [SKIP][177] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][178] ([Intel XE#1201])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-vm.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][180] ([Intel XE#1473] / [Intel XE#392])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         [SKIP][181] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][182] ([Intel XE#1201]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1214] / [Intel XE#1329]) -> [SKIP][184] ([Intel XE#1201])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][186] ([Intel XE#1195])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [SKIP][187] ([Intel XE#1192] / [Intel XE#1201]) -> [SKIP][188] ([Intel XE#1201])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_live_ktest@xe_bo.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [INCOMPLETE][189] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][190] ([Intel XE#1214] / [i915#10142])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#1191] / [Intel XE#1214]) -> [SKIP][192] ([Intel XE#1201])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_pm@s3-basic-exec.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [FAIL][193] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][194] ([Intel XE#1162])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-463/igt@xe_pm@s4-basic-exec.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1460
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
  [Intel XE#1495]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
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
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#10142]: https://gitlab.freedesktop.org/drm/intel/issues/10142


Build changes
-------------

  * Linux: xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82 -> xe-pw-132295v1

  IGT_7804: 7804
  xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82: 8fa0e230782f856c0b502d5294f56a593bc9bf82
  xe-pw-132295v1: 132295v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/index.html

--===============1898709278349262330==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add xe_guc_ads.c to uses_generated_oob</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132295/">https://patchwork.freedesktop.org/series/132295/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82_full -&gt; xe-pw-132295v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132295v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132295v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132295v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-FAIL</a> +4 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>{shard-lnl-1}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-1/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl-5}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>{shard-lnl-5}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-lnl-2}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl-1}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_lease@page-flip-implicit-plane@pipe-c-edp-2}:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@kms_lease@page-flip-implicit-plane@pipe-c-edp-2.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>{shard-lnl-2}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-2/igt@kms_psr@psr-suspend@edp-1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_exec_basic@twice-basic-defer-bind.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>{shard-lnl-3}:      <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@throttle_basic_api:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-3/igt@xe_gt_freq@throttle_basic_api.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132295v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-436/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_rmfb@close-fd@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@sriov_basic@bind-unbind-vf@vf-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@xe_evict@evict-beng-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-433/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-435/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:</p>
<ul>
<li>{shard-lnl-2}:      <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440">Intel XE#1440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-433/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-adlp-4/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-adlp-2/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82/shard-dg2-463/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132295v1/shard-dg2-464/igt@xe_pm@s4-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82 -&gt; xe-pw-132295v1</li>
</ul>
<p>IGT_7804: 7804<br />
  xe-1070-8fa0e230782f856c0b502d5294f56a593bc9bf82: 8fa0e230782f856c0b502d5294f56a593bc9bf82<br />
  xe-pw-132295v1: 132295v1</p>

</body>
</html>

--===============1898709278349262330==--
