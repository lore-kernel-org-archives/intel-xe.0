Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7785C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 23:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6A10EC51;
	Mon, 27 May 2024 23:45:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD8B10EC51;
 Mon, 27 May 2024 23:45:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2662422288679142526=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Add_more_document_to_?=
 =?utf-8?q?xe=5Fvm=3A=3Alock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 23:45:21 -0000
Message-ID: <171685352129.2213622.10023188767583579655@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527230731.1888261-1-oak.zeng@intel.com>
In-Reply-To: <20240527230731.1888261-1-oak.zeng@intel.com>
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

--===============2662422288679142526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add more document to xe_vm::lock
URL   : https://patchwork.freedesktop.org/series/134100/
State : failure

== Summary ==

CI Bug Log - changes from xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c_full -> xe-pw-134100v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134100v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134100v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134100v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@d3hot-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@d3hot-mmap-system.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - {shard-lnl}:        [SKIP][2] ([Intel XE#1407]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  
Known issues
------------

  Here are the changes found in xe-pw-134100v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1125] / [Intel XE#1201])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@size-max:
    - shard-adlp:         [PASS][5] -> [ABORT][6] ([Intel XE#1939])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-2/igt@kms_addfb_basic@size-max.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_addfb_basic@size-max.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#610])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][9] ([Intel XE#324]) +2 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +37 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +56 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455]) +25 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#308])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-adlp:         NOTRUN -> [FAIL][18] ([Intel XE#581])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#323])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][21] ([Intel XE#1195] / [Intel XE#927])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1138] / [Intel XE#1201])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1137] / [Intel XE#1201])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1135] / [Intel XE#1201])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#310]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][26] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201]) +38 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#656]) +55 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#1341])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#417])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#356])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][34] ([Intel XE#1191] / [Intel XE#1214]) +2 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a:
    - shard-adlp:         NOTRUN -> [FAIL][35] ([Intel XE#1331]) +5 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#870])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][41] ([Intel XE#718])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#1211])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#836])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#780])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#929]) +21 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1149] / [Intel XE#1201])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#1874]) +6 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#829]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][51] ([Intel XE#1174])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#362])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [ABORT][53] ([Intel XE#1939]) +1 other test abort
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#756])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#1932])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#1392]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#288]) +40 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#1638] / [Intel XE#358])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_exec_reset@cat-error.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#512])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#378])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_module_load@force-load.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1061] / [Intel XE#1201])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][68] ([Intel XE#1214])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [ABORT][69] ([Intel XE#1358])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][70] -> [DMESG-WARN][71] ([Intel XE#1214])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][73] ([Intel XE#1214] / [Intel XE#1760])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - {shard-lnl}:        [FAIL][74] ([Intel XE#1701]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][76] ([Intel XE#1659]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a1:
    - shard-adlp:         [ABORT][78] ([Intel XE#1939]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - {shard-lnl}:        [ABORT][80] ([Intel XE#1939]) -> [PASS][81] +4 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - {shard-lnl}:        [FAIL][84] ([Intel XE#1430]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr2-suspend:
    - {shard-lnl}:        [DMESG-WARN][86] ([Intel XE#1830]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-3/igt@kms_psr@psr2-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-1/igt@kms_psr@psr2-suspend.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - {shard-lnl}:        [ABORT][88] ([Intel XE#1761]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][90] ([Intel XE#1214] / [Intel XE#1608]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][92] ([Intel XE#324]) -> [FAIL][93] ([Intel XE#1231])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [INCOMPLETE][94] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][95] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][96] ([Intel XE#1195]) -> [DMESG-WARN][97] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][98] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][99] ([Intel XE#1204])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][100] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][101] ([Intel XE#1191] / [Intel XE#1214])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-adlp:         [SKIP][102] ([Intel XE#1201] / [Intel XE#1392]) -> [ABORT][103] ([Intel XE#1939])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_exec_basic@multigpu-once-rebind.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][104] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][105] ([Intel XE#1191] / [Intel XE#1214])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][107] ([Intel XE#1195] / [Intel XE#1694])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [INCOMPLETE][108] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [ABORT][109] ([Intel XE#1191] / [Intel XE#1358] / [Intel XE#1939])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@xe_pm@s3-basic-exec.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][110] ([Intel XE#1358] / [Intel XE#1794]) -> [DMESG-WARN][111] ([Intel XE#1214])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][113] ([Intel XE#1214] / [Intel XE#1760])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
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
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1829
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
  [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c -> xe-pw-134100v1

  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c: e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c
  xe-pw-134100v1: 134100v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/index.html

--===============2662422288679142526==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add more document to xe_vm::lock</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134100/">https://patchwork.freedesktop.org/series/134100/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c_full -&gt; xe-pw-134100v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134100v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134100v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134100v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@d3hot-mmap-system:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@d3hot-mmap-system.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_big_fb@x-tiled-64bpp-rotate-90:<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134100v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-2/igt@kms_addfb_basic@size-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_addfb_basic@size-max.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-validate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_prop_blob@blob-prop-validate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_exec_reset@cat-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-3/igt@kms_psr@psr2-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-1/igt@kms_psr@psr2-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761">Intel XE#1761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-6/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-8/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134100v1/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c -&gt; xe-pw-134100v1</li>
</ul>
<p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c: e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c<br />
  xe-pw-134100v1: 134100v1</p>

</body>
</html>

--===============2662422288679142526==--
