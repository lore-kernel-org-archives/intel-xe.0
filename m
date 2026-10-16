Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364ACC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 16:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E276897F6;
	Fri, 16 Oct 2026 16:29:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356AC897F6;
 Fri, 16 Oct 2026 16:29:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2528363394986256073=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Isolate_permanen?=
 =?utf-8?q?tly_wedged_devices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 16:29:35 -0000
Message-ID: <179216817520.35751.10787648469727358906@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016085527.311660-1-arvind.yadav@intel.com>
In-Reply-To: <20261016085527.311660-1-arvind.yadav@intel.com>
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

--===============2528363394986256073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Isolate permanently wedged devices (rev2)
URL   : https://patchwork.freedesktop.org/series/176267/
State : failure

== Summary ==

CI Bug Log - changes from xe-5958-25ac2be14e483405af697f32d04950fe737db1a9_FULL -> xe-pw-176267v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176267v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176267v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176267v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +40 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@xe_configfs@ctx-restore-post-bb-invalid:
    - shard-ptl:          [PASS][3] -> [DMESG-WARN][4] +35 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-1/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-2/igt@xe_configfs@ctx-restore-post-bb-invalid.html
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +38 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_configfs@ctx-restore-post-bb-invalid.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][7] +4 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][8] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_module_load@many-reload.html
    - shard-lnl:          NOTRUN -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-ptl:          NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  
New tests
---------

  New tests have been introduced between xe-5958-25ac2be14e483405af697f32d04950fe737db1a9_FULL and xe-pw-176267v2_FULL:

### New IGT tests (1) ###

  * igt@xe_oa@buffer-size@oag-0-32m:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  

Known issues
------------

  Here are the changes found in xe-pw-176267v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          NOTRUN -> [ABORT][13] ([Intel XE#9463])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5901]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#6925])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#5808]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#8365])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5822]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][26] -> [INCOMPLETE][27] ([Intel XE#7084] / [Intel XE#8150])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:
    - shard-ptl:          [PASS][28] -> [ABORT][29] ([Intel XE#7084] / [Intel XE#9367] / [Intel XE#9375])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652]) +12 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2724] / [Intel XE#7449])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2252])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5824])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#8391]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7358])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7358]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6969]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#6969]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#7642]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_content_protection@legacy-hdcp14.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7642])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#3304])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-7/igt@kms_content_protection@suspend-resume@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5900])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#9365]) +1 other test dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5962]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1508])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1340] / [Intel XE#7435])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#9527])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5907]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#8265]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2373] / [Intel XE#7448])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#2316]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#301])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#3321]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#7178]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#352]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +16 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4141]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#656] / [Intel XE#7905]) +8 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5812]) +29 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7061] / [Intel XE#7356])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7905]) +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7061]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#6312]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6312]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7865]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7061]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7399])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7865]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +15 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7061])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#9312])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-ptl:          [PASS][88] -> [ABORT][89] ([Intel XE#9362]) +5 other tests abort
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-2/igt@kms_hdr@bpc-switch-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-8/igt@kms_hdr@bpc-switch-suspend.html
    - shard-bmg:          [PASS][90] -> [ABORT][91] ([Intel XE#9438])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][92] -> [ABORT][93] ([Intel XE#9362] / [Intel XE#9438])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#7591])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6912] / [Intel XE#7375])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#7283]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-ptl:          [PASS][98] -> [FAIL][99] ([Intel XE#9340]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#7283]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#7283]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8396]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#7304])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2893] / [Intel XE#7304])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1489])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1406])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#1406])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#5821]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#5910])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1435] / [Intel XE#9142])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#6503])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [PASS][115] -> [FAIL][116] ([Intel XE#4227] / [Intel XE#7397]) +4 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-5/igt@kms_vrr@flip-basic-fastset.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][117] -> [FAIL][118] ([Intel XE#6293] / [Intel XE#7397])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#5948] / [Intel XE#9277])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][120] ([Intel XE#8868])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][121] -> [INCOMPLETE][122] ([Intel XE#6321] / [Intel XE#8355])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#5764]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#7482]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#7482]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1392]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#8374]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#8374]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#8374])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#8364]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#8364]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#8364]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-ptl:          [PASS][136] -> [ABORT][137] ([Intel XE#9145])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-1/igt@xe_exec_reset@gt-reset-fault-injection.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-3/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [PASS][138] -> [ABORT][139] ([Intel XE#9145])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:
    - shard-ptl:          [PASS][140] -> [DMESG-WARN][141] ([Intel XE#8652])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-1/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#8369])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#6196])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#6196])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [PASS][145] -> [FAIL][146] ([Intel XE#9096])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8378]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][148] ([Intel XE#8378])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#8378])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [PASS][150] -> [DMESG-WARN][151] ([Intel XE#7898])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#7954])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#6964]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-ptl:          NOTRUN -> [SKIP][154] ([Intel XE#7793])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_page_reclaim@boundary-split.html
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#7793])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_peer2peer@write.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#6867])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#584] / [Intel XE#7369])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][159] -> [ABORT][160] ([Intel XE#9362]) +2 other tests abort
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#7599])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#4733] / [Intel XE#7417])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#6019]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_query@multigpu-query-engines.html
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#944])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4273])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][166] -> [DMESG-WARN][167] ([Intel XE#8966])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@xe_survivability@runtime-survivability.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-lnl:          NOTRUN -> [FAIL][168] ([Intel XE#9424])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_vm@bind-array-enobufs.html

  * igt@xe_wedged@basic-wedged:
    - shard-ptl:          [PASS][169] -> [ABORT][170] ([Intel XE#8963])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-4/igt@xe_wedged@basic-wedged.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-8/igt@xe_wedged@basic-wedged.html
    - shard-lnl:          [PASS][171] -> [ABORT][172] ([Intel XE#8963]) +1 other test abort
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_wedged@basic-wedged.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [PASS][173] -> [DMESG-WARN][174] ([Intel XE#8963])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-10/igt@xe_wedged@basic-wedged.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-7/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][175] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-ptl:          [FAIL][177] ([Intel XE#8628]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-ptl:          [ABORT][179] ([Intel XE#7084] / [Intel XE#9362]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [DMESG-WARN][181] ([Intel XE#9388]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-ptl:          [DMESG-WARN][183] ([Intel XE#9389]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [ABORT][185] ([Intel XE#9362]) -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [DMESG-WARN][187] ([Intel XE#9365] / [Intel XE#9465]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-9/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][189] ([Intel XE#9365]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [ABORT][191] ([Intel XE#9362]) -> [PASS][192] +4 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [ABORT][193] ([Intel XE#9362] / [Intel XE#9581]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-7/igt@xe_ccs@suspend-resume.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_ccs@suspend-resume.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][195], [PASS][196], [PASS][197], [SKIP][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [DMESG-WARN][245] ([Intel XE#7727]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][247] ([Intel XE#9254]) -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [FAIL][249] ([Intel XE#9461]) -> [PASS][250] +1 other test pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][251] ([Intel XE#9365] / [Intel XE#9482]) -> [INCOMPLETE][252] ([Intel XE#7084] / [Intel XE#8150])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-ptl:          [ABORT][253] ([Intel XE#7084] / [Intel XE#9362] / [Intel XE#9364] / [Intel XE#9378]) -> [ABORT][254] ([Intel XE#7084] / [Intel XE#9367] / [Intel XE#9375])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-ptl:          [ABORT][255] ([Intel XE#9362]) -> [FAIL][256] ([Intel XE#7695])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-8/igt@xe_pat@pat-sw-hw-suspend.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_pat@pat-sw-hw-suspend.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7898]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7898
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#8966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9367
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9388
  [Intel XE#9389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9389
  [Intel XE#9424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424
  [Intel XE#9438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9465
  [Intel XE#9482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581


Build changes
-------------

  * Linux: xe-5958-25ac2be14e483405af697f32d04950fe737db1a9 -> xe-pw-176267v2

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5958-25ac2be14e483405af697f32d04950fe737db1a9: 25ac2be14e483405af697f32d04950fe737db1a9
  xe-pw-176267v2: 176267v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/index.html

--===============2528363394986256073==
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
<tr><td><b>Series:</b></td><td>drm/xe: Isolate permanently wedged devices (=
rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/176267/">https://patchwork.freedesktop.org/series/176267/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176267v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176267v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5958-25ac2be14e483405af697f32d04950fe7=
37db1a9_FULL -&gt; xe-pw-176267v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176267v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-176267v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1762=
67v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-7/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@core_hotunplug@hotreplug.htm=
l">DMESG-WARN</a> +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb-invalid:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-1/igt@xe_confi=
gfs@ctx-restore-post-bb-invalid.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-2/igt@xe_configfs@c=
tx-restore-post-bb-invalid.html">DMESG-WARN</a> +35 other tests dmesg-warn<=
/li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_confi=
gfs@ctx-restore-post-bb-invalid.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_configfs@c=
tx-restore-post-bb-invalid.html">DMESG-WARN</a> +38 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> +4 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_module_load@many-reload.ht=
ml">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_module_load@many-reload.ht=
ml">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@xe_pm@s2idle-exec-after.html"=
>ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
6267v2/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_eng=
ine_class_video_decode0.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5958-25ac2be14e483405af697f32d=
04950fe737db1a9_FULL and xe-pw-176267v2_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_oa@buffer-size@oag-0-32m:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176267v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@core_hotunplug@hotreplug-late=
close.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5822">Intel XE#5822</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg=
-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Int=
el XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9367">Intel XE#9367</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9375">Intel XE#9375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_chamelium_audio@hdmi-audi=
o-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@=
plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@kms_chamelium_color_pipeline@=
plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_chamelium_frames@hdmi-crc=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-sto=
rm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_color_pipeline@plane-ctm=
3x4@pipe-c-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_color_pipeline@plane-lut1=
d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_content_protection@legacy=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_content_protection@legacy=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-7/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_cursor_crc@cursor-offscr=
een-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@kms_cursor_crc@cursor-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9365">Intel XE#9365</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_dp_link_training@uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vbla=
nk@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +29 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +=
3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
drrs-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbch=
dr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbch=
dr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbch=
dr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-=
1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
hdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_hdmi_audio_bw@dpms-audio-=
recovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-2/igt@kms_hdr@=
bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-176267v2/shard-ptl-8/igt@kms_hdr@bpc-switch-suspend=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9362">Intel XE#9362</a>) +5 other tests abort</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@kms_hdr@=
bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9438">Intel XE#9438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@kms_hdr@=
bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/=
igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Int=
el XE#9362</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9438">Intel XE#9438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-5/igt@kms_plan=
e@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard=
-ptl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9340">Intel XE#9340</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_plane@pixel-format-yf-ti=
led-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulati=
on@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_psr@pr-cursor-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_psr@psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@kms_sharpness_filter@filter-=
scaler-downscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-5/igt@kms_vrr@=
flip-basic-fastset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_vrr@flip-basic-fastset=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7397">Intel XE#7397</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-5/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_vrr@flip-=
basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5948">Intel XE#5948</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@sriov_basic@pf-unbind-with-v=
fs-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_evict@evict-cm-threads-lar=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@xe_evict@evict-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_balancer@no-exec-para=
llel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_balancer@no-exec-para=
llel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#=
5575</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
484">Intel XE#7484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_exec_basic@multigpu-no-ex=
ec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_exec_fault_mode@many-mult=
i-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_exec_multi_queue@one-queu=
e-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-1/igt@xe_exec_=
reset@gt-reset-fault-injection.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-3/igt@xe_exec_reset@=
gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_exec_=
reset@gt-reset-fault-injection.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_exec_reset@=
gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-2/igt@xe_exec_=
reset@gt-stress-reset-destroy-vm-context.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-1/igt@xe_e=
xec_reset@gt-stress-reset-destroy-vm-context.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_exec_reset@multi-queue-cat=
-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-7/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/ig=
t@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9=
096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-4/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-4/ig=
t@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7898">Int=
el XE#7898</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_page_reclaim@boundary-spli=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_page_reclaim@boundary-spli=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427"=
>Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6867">Intel XE#6867</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-10/igt@xe_prefetch_fault@prefetch-f=
ault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-3/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6019">Intel XE#6019</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-1/igt@xe_survi=
vability@runtime-survivability.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe_survivabili=
ty@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8966">Intel XE#8966</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_vm@bind-array-enobufs.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9424">Intel XE#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-4/igt@xe_wedge=
d@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176267v2/shard-ptl-8/igt@xe_wedged@basic-wedged.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/89=
63">Intel XE#8963</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_wedge=
d@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_wedged@basic-wedged.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/89=
63">Intel XE#8963</a>) +1 other test abort</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-10/igt@xe_wedg=
ed@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176267v2/shard-bmg-7/igt@xe_wedged@basic-wedged.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-2/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2=
/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1762=
67v2/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-=
flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362"=
>Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-=
ccs@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9388">Intel XE#9=
388</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-=
edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9389">Intel XE#9=
389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-=
edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-6/igt@kms_flip@flip=
-vs-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-3/igt@kms_vbla=
nk@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9465">Intel XE#9465=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1762=
67v2/shard-bmg-9/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-3/igt@kms_vbla=
nk@ts-continuation-dpms-suspend@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1762=
67v2/shard-bmg-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-1/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-5/igt@kms_=
vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-7/igt@xe_ccs@s=
uspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9362">Intel XE#9362</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9581">Intel XE#9581</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-5/igt@xe=
_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-2=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737d=
b1a9/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe=
737db1a9/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d049=
50fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32=
d04950fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af69=
7f32d04950fe737db1a9/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405=
af697f32d04950fe737db1a9/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be14e48=
3405af697f32d04950fe737db1a9/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac2be1=
4e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-25ac=
2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5958-=
25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176267v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176267v2/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176267v2/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176267v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176267v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176267v2/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176267v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176267v2/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-5/igt@xe_pm@s4=
-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-lnl-4/igt@xe_pm@s4-basi=
c-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-5/igt@xe_pm_re=
sidency@gt-c6-freeze@gt0.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-bmg-1/igt@xe_pm_=
residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-lnl-8/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel=
 XE#9461</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-176267v2/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_=
xe_engine_class_copy0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482">Intel XE#=
9482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
176267v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364"=
>Intel XE#9364</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9378">Intel XE#9378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-176267v2/shard-ptl-7/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-lnl-ccs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9367">Intel XE#9367</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5958-25ac2be14e483405af697f32d04950fe737db1a9/shard-ptl-8/igt@xe_pat@p=
at-sw-hw-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176267v2/shard-ptl-6/igt@xe_pat@pat-sw=
-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5958-25ac2be14e483405af697f32d04950fe737db1a9 -&gt; xe-pw-176=
267v2</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5958-25ac2be14e483405af697f32d04950fe737db1a9: 25ac2be14e483405af697f3=
2d04950fe737db1a9<br />
  xe-pw-176267v2: 176267v2</p>

</body>
</html>

--===============2528363394986256073==--
