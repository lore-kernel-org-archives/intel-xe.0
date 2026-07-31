Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B80C55162
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 01:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1073810E1A0;
	Fri, 31 Jul 2026 01:21:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFEF10E1A0;
 Fri, 31 Jul 2026 01:21:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6195822006012422845=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Modify_the_SW_tail_logic_i?=
 =?utf-8?q?n_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jul 2026 01:21:01 -0000
Message-ID: <178546086110.7120.6683341832210363674@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
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

--===============6195822006012422845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Modify the SW tail logic in OA
URL   : https://patchwork.freedesktop.org/series/171393/
State : failure

== Summary ==

CI Bug Log - changes from xe-5511-374d957e1908042c257b8c239974317bb93b83dc_FULL -> xe-pw-171393v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171393v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171393v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171393v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_oa@blocking:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-7/igt@xe_oa@blocking.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-2/igt@xe_oa@blocking.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-2/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  
Known issues
------------

  Here are the changes found in xe-pw-171393v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@fbdev@read.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@fbdev@read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#5177] / [Intel XE#8714])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@intel_hwmon@hwmon-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7679])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#373]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#3304] / [Intel XE#7374])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7642])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#309] / [Intel XE#7343]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1340] / [Intel XE#7435])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1421]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7351])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7905]) +9 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#6312])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1469] / [Intel XE#7399])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7061]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2352] / [Intel XE#7399])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7865]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8303]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7283])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8076])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8396]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1131])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#8710] / [Intel XE#8714])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2893] / [Intel XE#7304])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1406])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#7345])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#4609])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6540] / [Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8714]) +261 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7482]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_balancer@once-cm-parallel-rebind.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#8714]) +649 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1392]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8374])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#8374]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8364]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#8364]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#8378]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [PASS][64] -> [ABORT][65] ([Intel XE#8007])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6964] / [Intel XE#8714])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#944])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#3342])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#8339])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][70] ([Intel XE#2134]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@fbdev@nullptr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@fbdev@nullptr.html

  * igt@kms_async_flips@test-time-stamp-atomic:
    - shard-lnl:          [INCOMPLETE][72] ([Intel XE#8606]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-8/igt@kms_async_flips@test-time-stamp-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_async_flips@test-time-stamp-atomic.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][74] ([Intel XE#8714]) -> [PASS][75] +763 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][76] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [INCOMPLETE][78] ([Intel XE#1727] / [Intel XE#6819]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][80] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][82] ([Intel XE#2229]) -> [PASS][83] +2 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_live_ktest@xe_bo.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][84] ([Intel XE#8714]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][86] ([Intel XE#8714]) -> [SKIP][87] ([Intel XE#2233])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][88] ([Intel XE#8714]) -> [SKIP][89] ([Intel XE#2370])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][90] ([Intel XE#2327]) -> [SKIP][91] ([Intel XE#8714]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][92] ([Intel XE#8714]) -> [SKIP][93] ([Intel XE#2327]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][94] ([Intel XE#8714]) -> [SKIP][95] ([Intel XE#7059] / [Intel XE#7085])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][96] ([Intel XE#8714]) -> [SKIP][97] ([Intel XE#1124]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][98] ([Intel XE#8714]) -> [SKIP][99] ([Intel XE#2328] / [Intel XE#7367]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][100] ([Intel XE#1124]) -> [SKIP][101] ([Intel XE#8714]) +11 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][102] ([Intel XE#8714]) -> [SKIP][103] ([Intel XE#607] / [Intel XE#7361]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][104] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][105] ([Intel XE#8714])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][106] ([Intel XE#8714]) -> [SKIP][107] ([Intel XE#7679]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][108] ([Intel XE#7679]) -> [SKIP][109] ([Intel XE#8714])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][110] ([Intel XE#367]) -> [SKIP][111] ([Intel XE#8714]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][112] ([Intel XE#8714]) -> [SKIP][113] ([Intel XE#367]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][114] ([Intel XE#2887]) -> [SKIP][115] ([Intel XE#8714]) +13 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][116] ([Intel XE#8714]) -> [SKIP][117] ([Intel XE#3432]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][118] ([Intel XE#8714]) -> [SKIP][119] ([Intel XE#2887]) +15 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][120] ([Intel XE#2652]) -> [SKIP][121] ([Intel XE#8714]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][122] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][123] ([Intel XE#8714]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][124] ([Intel XE#8714]) -> [SKIP][125] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][126] ([Intel XE#8714]) -> [SKIP][127] ([Intel XE#7358])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          [SKIP][128] ([Intel XE#7358]) -> [SKIP][129] ([Intel XE#8714])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][130] ([Intel XE#8714]) -> [SKIP][131] ([Intel XE#2252]) +6 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][132] ([Intel XE#2252]) -> [SKIP][133] ([Intel XE#8714]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [SKIP][134] ([Intel XE#8714]) -> [FAIL][135] ([Intel XE#3304] / [Intel XE#7374])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][136] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][137] ([Intel XE#8714])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][138] ([Intel XE#7642]) -> [SKIP][139] ([Intel XE#8714])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_content_protection@lic-type-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][140] ([Intel XE#8714]) -> [SKIP][141] ([Intel XE#7642])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_content_protection@mei-interface.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][142] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][143] ([Intel XE#8714]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_content_protection@suspend-resume.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][144] ([Intel XE#8714]) -> [SKIP][145] ([Intel XE#2320]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][146] ([Intel XE#2320]) -> [SKIP][147] ([Intel XE#8714]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][148] ([Intel XE#8714]) -> [SKIP][149] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][150] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][151] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][152] ([Intel XE#7571]) -> [SKIP][153] ([Intel XE#8714])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][154] ([Intel XE#8714]) -> [FAIL][155] ([Intel XE#7571])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][156] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][157] ([Intel XE#8714])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          [SKIP][158] ([Intel XE#8714]) -> [SKIP][159] ([Intel XE#8265]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][160] ([Intel XE#8265]) -> [SKIP][161] ([Intel XE#8714]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][162] ([Intel XE#8714]) -> [SKIP][163] ([Intel XE#2372] / [Intel XE#7359])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][164] ([Intel XE#8714]) -> [SKIP][165] ([Intel XE#2373] / [Intel XE#7448])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][166] ([Intel XE#8714]) -> [SKIP][167] ([Intel XE#2375])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][168] ([Intel XE#8714]) -> [SKIP][169] ([Intel XE#2374] / [Intel XE#6127])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][170] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][171] ([Intel XE#8714]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][172] ([Intel XE#8714]) -> [SKIP][173] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][174] ([Intel XE#8714]) -> [SKIP][175] ([Intel XE#7179])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][176] ([Intel XE#2311]) -> [SKIP][177] ([Intel XE#8714]) +58 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][178] ([Intel XE#8714]) -> [SKIP][179] ([Intel XE#2311]) +68 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#4141]) -> [SKIP][181] ([Intel XE#8714]) +11 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#8714]) -> [SKIP][183] ([Intel XE#4141]) +18 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][184] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][185] ([Intel XE#8714]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][186] ([Intel XE#7061]) -> [SKIP][187] ([Intel XE#8714]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][188] ([Intel XE#8714]) -> [SKIP][189] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][190] ([Intel XE#7399]) -> [SKIP][191] ([Intel XE#8714])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][192] ([Intel XE#8714]) -> [SKIP][193] ([Intel XE#7061]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][194] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][195] ([Intel XE#8714])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][196] ([Intel XE#8714]) -> [SKIP][197] ([Intel XE#2313]) +68 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][198] ([Intel XE#2313]) -> [SKIP][199] ([Intel XE#8714]) +58 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][200] ([Intel XE#3544]) -> [SKIP][201] ([Intel XE#3374] / [Intel XE#3544])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][202] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][203] ([Intel XE#8714])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][204] ([Intel XE#4298] / [Intel XE#5873]) -> [SKIP][205] ([Intel XE#8714])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][206] ([Intel XE#8714]) -> [SKIP][207] ([Intel XE#6911] / [Intel XE#7378]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][208] ([Intel XE#8714]) -> [SKIP][209] ([Intel XE#6901])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][210] ([Intel XE#8714]) -> [SKIP][211] ([Intel XE#6911] / [Intel XE#7466])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          [SKIP][212] ([Intel XE#8348]) -> [SKIP][213] ([Intel XE#8714])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_mst@mst-suspend-read-crc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][214] ([Intel XE#8714]) -> [SKIP][215] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][216] ([Intel XE#8714]) -> [SKIP][217] ([Intel XE#7283]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][218] ([Intel XE#7283]) -> [SKIP][219] ([Intel XE#8714]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][220] ([Intel XE#2393]) -> [SKIP][221] ([Intel XE#8714])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][222] ([Intel XE#8714]) -> [SKIP][223] ([Intel XE#2393])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][224] ([Intel XE#8714]) -> [SKIP][225] ([Intel XE#5020] / [Intel XE#7348])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][226] ([Intel XE#8714]) -> [SKIP][227] ([Intel XE#2763] / [Intel XE#6886])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][228] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][229] ([Intel XE#8714]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][230] ([Intel XE#8714]) -> [SKIP][231] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][232] ([Intel XE#8714]) -> [SKIP][233] ([Intel XE#6927])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][234] ([Intel XE#7794]) -> [SKIP][235] ([Intel XE#8714])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][236] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][237] ([Intel XE#8714])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][238] ([Intel XE#8714]) -> [SKIP][239] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][240] ([Intel XE#6814] / [Intel XE#7428]) -> [SKIP][241] ([Intel XE#8714])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_pm_rpm@package-g7.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][242] ([Intel XE#1489]) -> [SKIP][243] ([Intel XE#8714]) +9 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][244] ([Intel XE#8714]) -> [SKIP][245] ([Intel XE#1489]) +6 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][246] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][247] ([Intel XE#8714])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][248] ([Intel XE#8714]) -> [SKIP][249] ([Intel XE#2387] / [Intel XE#7429]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][250] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][251] ([Intel XE#8714]) +10 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][252] ([Intel XE#8714]) -> [SKIP][253] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][254] ([Intel XE#2234]) -> [SKIP][255] ([Intel XE#8714])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@psr2-primary-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][256] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][257] ([Intel XE#8714]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][258] ([Intel XE#8714]) -> [SKIP][259] ([Intel XE#3904] / [Intel XE#7342])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][260] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][261] ([Intel XE#8714])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][262] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][263] ([Intel XE#8714])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][264] ([Intel XE#8714]) -> [SKIP][265] ([Intel XE#6503]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][266] ([Intel XE#6503]) -> [SKIP][267] ([Intel XE#8714]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_sharpness_filter@filter-tap.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][268] ([Intel XE#8714]) -> [SKIP][269] ([Intel XE#1499]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_vrr@flip-basic.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][270] ([Intel XE#1499]) -> [SKIP][271] ([Intel XE#8714]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_vrr@flipline.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][272] ([Intel XE#6599]) -> [SKIP][273] ([Intel XE#8714])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_compute@ccs-mode-compute-kernel.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_configfs@engines-allowed-invalid:
    - shard-bmg:          [ABORT][274] ([Intel XE#8007]) -> [SKIP][275] ([Intel XE#8714])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_configfs@engines-allowed-invalid.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][276] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][277] ([Intel XE#8714])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][278] ([Intel XE#8370]) -> [SKIP][279] ([Intel XE#8714])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][280] ([Intel XE#8714]) -> [SKIP][281] ([Intel XE#8370]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][282] ([Intel XE#8714]) -> [SKIP][283] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][284] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][285] ([Intel XE#8714]) +8 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][286] ([Intel XE#8578]) -> [SKIP][287] ([Intel XE#8714])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:
    - shard-bmg:          [SKIP][288] ([Intel XE#8374]) -> [SKIP][289] ([Intel XE#8714]) +9 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][290] ([Intel XE#8714]) -> [SKIP][291] ([Intel XE#8374]) +17 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][292] ([Intel XE#8364]) -> [SKIP][293] ([Intel XE#8714]) +26 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][294] ([Intel XE#8714]) -> [SKIP][295] ([Intel XE#8364]) +35 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][296] ([Intel XE#8714]) -> [SKIP][297] ([Intel XE#8369])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][298] ([Intel XE#8369]) -> [SKIP][299] ([Intel XE#8714]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [SKIP][300] ([Intel XE#8714]) -> [INCOMPLETE][301] ([Intel XE#7098] / [Intel XE#8159])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][302] ([Intel XE#8378]) -> [SKIP][303] ([Intel XE#8714]) +7 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][304] ([Intel XE#8714]) -> [SKIP][305] ([Intel XE#8378]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [SKIP][306] ([Intel XE#8714]) -> [ABORT][307] ([Intel XE#8007])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          [SKIP][308] ([Intel XE#6964] / [Intel XE#8714]) -> [SKIP][309] ([Intel XE#6964]) +5 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-bmg:          [SKIP][310] ([Intel XE#6964]) -> [SKIP][311] ([Intel XE#6964] / [Intel XE#8714]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][312] ([Intel XE#8714]) -> [SKIP][313] ([Intel XE#7793]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          [SKIP][314] ([Intel XE#7793]) -> [SKIP][315] ([Intel XE#8714]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_page_reclaim@boundary-split.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][316] ([Intel XE#8714]) -> [SKIP][317] ([Intel XE#7590]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][318] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][319] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8714])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_peer2peer@read.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][320] ([Intel XE#8714]) -> [SKIP][321] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pm@d3cold-basic.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][322] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][323] ([Intel XE#8714])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_pm@d3cold-basic-exec.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][324] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][325] ([Intel XE#8714])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          [SKIP][326] ([Intel XE#8714]) -> [SKIP][327] ([Intel XE#7599])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][328] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][329] ([Intel XE#8714]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][330] ([Intel XE#8714]) -> [SKIP][331] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][332] ([Intel XE#944]) -> [SKIP][333] ([Intel XE#8714]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][334] ([Intel XE#8714]) -> [SKIP][335] ([Intel XE#944]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][336] ([Intel XE#6627] / [Intel XE#7419]) -> [SKIP][337] ([Intel XE#8714])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_survivability@runtime-survivability.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8606
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5511-374d957e1908042c257b8c239974317bb93b83dc -> xe-pw-171393v1

  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5511-374d957e1908042c257b8c239974317bb93b83dc: 374d957e1908042c257b8c239974317bb93b83dc
  xe-pw-171393v1: 171393v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/index.html

--===============6195822006012422845==
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
<tr><td><b>Series:</b></td><td>Modify the SW tail logic in OA</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171393/">https://patchwork.freedesktop.org/series/171393/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-171393v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-171393v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5511-374d957e1908042c257b8c239974317bb=
93b83dc_FULL -&gt; xe-pw-171393v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171393v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-171393v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1713=
93v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-7/igt@xe_oa@bl=
ocking.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-171393v1/shard-lnl-2/igt@xe_oa@blocking.html">FAIL</a> +4 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_oa@o=
a-unit-concurrent-oa-buffer-read.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-2/igt@xe_oa@oa-uni=
t-concurrent-oa-buffer-read.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171393v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@fbdev@re=
ad.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-171393v1/shard-bmg-7/igt@fbdev@read.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@intel_hw=
mon@hwmon-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
177">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@=
plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-=
after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
hdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane@planar-pixel-forma=
t-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#68=
86</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap=
@pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_r=
pm@legacy-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_rpm@legacy-plane=
s-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8710">Intel XE#8710</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane=
-move@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_evict@evict-cm-threads-sma=
ll-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_balancer@many-execque=
ues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +261 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_balancer@once-cm-para=
llel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_exec=
_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_basi=
c@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +649 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetc=
h:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shar=
d-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_ini=
t.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-acc=
ess-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6964">Intel XE#6964</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171393v1/shard-lnl-7/igt@xe_sriov_scheduling@default-e=
nabled-fair-scheduling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@fbdev@nullptr.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-8/igt@kms_asyn=
c_flips@test-time-stamp-atomic.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8606">Intel XE#8606</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-lnl-=
7/igt@kms_async_flips@test-time-stamp-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +763 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">=
Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6819">Intel XE#6819</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-171393v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fb=
chdr-1p-offscreen-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@xe_live_ktest@xe_b=
o.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_modul=
e_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-=
10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-171393v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_big_=
fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms=
_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_=
fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_b=
ig_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/=
shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_=
fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@kms_bi=
g_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bm=
g-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#6=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/736=
1">Intel XE#7361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/sh=
ard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-b=
mg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@l=
inear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard=
-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Inte=
l XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7=
/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard=
-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Int=
el XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10=
/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>=
) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_cham=
elium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bm=
g-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cham=
elium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/i=
gt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_cha=
melium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/=
shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shar=
d-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">I=
ntel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_cham=
elium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cont=
ent_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/i=
gt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel =
XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/=
shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_con=
tent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_=
content_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_cont=
ent_protection@suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel X=
E#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171393v1/shard-bmg-7/igt@kms_content_protection@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/i=
gt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_cur=
sor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@k=
ms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@=
kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171393v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Int=
el XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-171393v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cur=
sor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_dsc@=
dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@k=
ms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_dsc=
@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/=
igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_f=
eature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel =
XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1393v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile=
-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1393v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear=
-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-=
bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-171393v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cu=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
393v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-=
draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141">Intel XE#4141</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">In=
tel XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-171393v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616=
f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1=
/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-=
7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/s=
hard-bmg-9/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171393v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8714">Intel XE#8714</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard=
-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bm=
g-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg=
-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#69=
11</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/746=
6">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_mst=
@mst-suspend-read-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_mst@m=
st-suspend-read-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6=
912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
75">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plan=
e@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Int=
el XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-171393v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-c=
c-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_plan=
e@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Inte=
l XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-171393v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_pla=
ne_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_plane_lo=
wres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_plane_=
multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
393v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fac=
tor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393=
v1/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_d=
c@dc3co-after-dc6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_pm_dc@dc3=
co-after-dc6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_pm_=
dc@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_pm_=
dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_pm_dc@dc5-psr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7=
/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_pm_rpm@mode=
set-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms=
_pm_rpm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shar=
d-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-b=
mg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bm=
g-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@kms_psr=
2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-=
bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +=
10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr@=
psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_psr@=
psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-b=
mg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bm=
g-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#=
3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1393v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_set=
mode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shar=
d-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_shar=
pness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@kms_s=
harpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@kms_sha=
rpness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_sh=
arpness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_vrr@=
flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@kms_vrr@flip-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@kms_vrr@=
flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@kms_vrr@flipline.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_compu=
te@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_c=
ompute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-4/igt@xe_confi=
gfs@engines-allowed-invalid.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe=
_configfs@engines-allowed-invalid.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel =
XE#7350</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-171393v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_evict=
@evict-small-multi-queue-priority.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/i=
gt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_evict=
@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-=
8/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_=
fault_mode@atomic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_exec_=
fault_mode@atomic-many.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-rebind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/s=
hard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-pre=
fetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8374">Intel XE#8374</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_=
multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Inte=
l XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-171393v1/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-f=
ault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +26 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-171393v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-f=
ault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +35 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_=
reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/ig=
t@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_exec_=
reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-=
bmg-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_=
system_allocator@many-stride-new-prefetch.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard=
-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098=
">Intel XE#7098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_exec=
_threads@threads-multi-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#=
8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171393v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-inv=
alidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-171393v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-share=
d-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exe=
c_queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_fault=
_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-f=
ail-xe_hw_engine_group_add_exec_queue.html">ABORT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_multi=
gpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shar=
d-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_multi=
gpu_svm@mgpu-coherency-fail-prefetch.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-=
7/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_page_=
reclaim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-3/igt@xe_page_rec=
laim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_page_=
reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_page_=
reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pat@x=
a-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@xe_pa=
t@xa-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#695=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326=
">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7353">Intel XE#7353</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-8/igt@xe_pm@d3cold-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-10/igt@xe_pm@d=
3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/ig=
t@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_prefe=
tch_fault@prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-10/igt@x=
e_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/sha=
rd-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pxp@p=
xp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg=
-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#47=
33</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/741=
7">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-7/ig=
t@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171393v1/shard-bmg-9/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-2/igt@xe_survi=
vability@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
93v1/shard-bmg-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5511-374d957e1908042c257b8c239974317bb93b83dc -&gt; xe-pw-171=
393v1</li>
</ul>
<p>IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5511-374d957e1908042c257b8c239974317bb93b83dc: 374d957e1908042c257b8c2=
39974317bb93b83dc<br />
  xe-pw-171393v1: 171393v1</p>

</body>
</html>

--===============6195822006012422845==--
