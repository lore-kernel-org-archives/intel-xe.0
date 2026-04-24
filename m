Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC87FED3E3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 15:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADDA10E365;
	Fri, 24 Apr 2026 15:26:13 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B7E10E1BE;
 Fri, 24 Apr 2026 15:26:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7566649614938125716=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_vfio/xe=3A_avoid_duplicate?=
 =?utf-8?q?_reset_in_xe=5Fvfio=5Fpci=5Freset=5Fdone?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: zhaoguohan@kylinos.cn
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 15:26:12 -0000
Message-ID: <177704437251.7958.15973964721168666246@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
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

--===============7566649614938125716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done
URL   : https://patchwork.freedesktop.org/series/165429/
State : failure

== Summary ==

CI Bug Log - changes from xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_FULL -> xe-pw-165429v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165429v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165429v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165429v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square-userenv:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@xe_compute@compute-square-userenv.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_compute@compute-square-userenv.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +40 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_oa@polling:
    - shard-bmg:          NOTRUN -> [SKIP][5] +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_oa@polling.html

  
#### Warnings ####

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [SKIP][6] ([Intel XE#7825]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_hdr@bpc-switch-dpms.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][8] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          [SKIP][10] ([Intel XE#7140]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@xe_evict@evict-small-multi-queue.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue.html

  
New tests
---------

  New tests have been introduced between xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_FULL and xe-pw-165429v1_FULL:

### New IGT tests (1) ###

  * igt@kms_atomic@plane-cursor-legacy@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  

Known issues
------------

  Here are the changes found in xe-pw-165429v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2134]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@fbdev@pan.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@fbdev@pan.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#7006])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7006])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6969]) +10 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6969] / [Intel XE#7006])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#6707] / [Intel XE#7439])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2321] / [Intel XE#7355])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#7825]) +50 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7825]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2286] / [Intel XE#6035])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2244])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2373])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_feature_discovery@display-1x.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][35] -> [ABORT][36] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#6266]) +3 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#3149] / [Intel XE#6266])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#5408] / [Intel XE#6266]) +4 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2482])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#4882])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_flip@flip-vs-dpms-on-nop.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2482]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_flip@flip-vs-panning-vs-hang.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7178] / [Intel XE#7349])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2380])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#7178])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4141])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2548] / [Intel XE#6314]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6314])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2352] / [Intel XE#7399])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2313]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2548] / [Intel XE#6314])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2568])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_invalid_mode@int-max-clock.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6901])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#7086])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7591])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7111])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#7780])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_plane@planar-pixel-format-settings.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-position-covered:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#7111]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_plane@plane-position-covered.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#7082])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][75] ([Intel XE#7725])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-a-dp-2.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][76] ([Intel XE#7725])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2763] / [Intel XE#6886]) +19 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7376] / [Intel XE#870])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1439] / [Intel XE#836])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1489]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][86] ([Intel XE#6361]) +4 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#6361]) +2 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1499])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#4227]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#6568])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@xe_eu_stall@invalid-gt-id.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#6568])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7636]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-basic:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#7827]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7826]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7136]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#7826]) +27 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6874]) +10 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#7824]) +300 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:
    - shard-bmg:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#7725]) +2 other tests dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7824]) +19 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#7138]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#2229])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#5100])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#6964])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          [PASS][114] -> [FAIL][115] ([Intel XE#7695])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@pat-sw-hw-compare.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][116] ([Intel XE#7695])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#7590])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [PASS][119] -> [DMESG-WARN][120] ([Intel XE#5545])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][121] ([Intel XE#2134]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@fbdev@write.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][123] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][124] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][125] ([Intel XE#6078]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][127] ([Intel XE#7825]) -> [PASS][128] +67 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@gamma:
    - shard-bmg:          [SKIP][129] ([Intel XE#3297]) -> [PASS][130] +2 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color@gamma.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_color@gamma.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][131] ([Intel XE#2291]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][133] ([Intel XE#3321]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][135] ([Intel XE#2316]) -> [PASS][136] +8 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][137] ([Intel XE#4882]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][139] ([Intel XE#2482]) -> [PASS][140] +4 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [SKIP][141] ([Intel XE#7178]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][143] ([Intel XE#2380]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][145] ([Intel XE#2548] / [Intel XE#6314]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][147] ([Intel XE#7308]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-bmg:          [SKIP][149] ([Intel XE#2568]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_invalid_mode@clock-too-high.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][151] ([Intel XE#7111]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-bmg:          [SKIP][153] ([Intel XE#7082]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-7efc.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-bmg:          [SKIP][155] ([Intel XE#7687]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@invalid-parameters.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - shard-bmg:          [SKIP][157] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][158] +29 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][159] ([Intel XE#7079]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@drm-resources-equal.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][161] ([Intel XE#4886]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@universal-planes.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-bmg:          [SKIP][163] ([Intel XE#7089]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@colorop-properties-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-bmg:          [SKIP][165] ([Intel XE#7112]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_properties@plane-properties-legacy.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-bmg:          [SKIP][167] ([Intel XE#6568]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_eu_stall@non-blocking-re-enable.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [SKIP][169] ([Intel XE#7827]) -> [PASS][170] +5 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-preempt-fence-early:
    - shard-bmg:          [DMESG-FAIL][171] -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_compute_mode@many-preempt-fence-early.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_exec_compute_mode@many-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - shard-bmg:          [SKIP][173] ([Intel XE#7826]) -> [PASS][174] +30 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-bmg:          [DMESG-WARN][175] -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_reset@cm-cat-error.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-bmg:          [FAIL][177] -> [PASS][178] +3 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [SKIP][179] ([Intel XE#7824]) -> [PASS][180] +361 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_mmap@pci-membarrier:
    - shard-bmg:          [SKIP][181] ([Intel XE#5100]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_mmap@pci-membarrier.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_mmap@pci-membarrier.html

  * igt@xe_pat@false-sharing:
    - shard-bmg:          [SKIP][183] ([Intel XE#7590]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@false-sharing.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_pat@false-sharing.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [SKIP][185] -> [PASS][186] +45 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][187] ([Intel XE#2370]) -> [SKIP][188] ([Intel XE#7825]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][189] ([Intel XE#7825]) -> [SKIP][190] ([Intel XE#2327]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][191] ([Intel XE#2327]) -> [SKIP][192] ([Intel XE#7825])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][193] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][194] ([Intel XE#7825]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][195] ([Intel XE#7825]) -> [SKIP][196] ([Intel XE#7059] / [Intel XE#7085])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][197] ([Intel XE#7825]) -> [SKIP][198] ([Intel XE#1124]) +11 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][199] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][200] ([Intel XE#7825])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][201] ([Intel XE#7825]) -> [SKIP][202] ([Intel XE#610] / [Intel XE#7387])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][203] ([Intel XE#7825]) -> [SKIP][204] ([Intel XE#607] / [Intel XE#7361])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][205] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][206] ([Intel XE#7825])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][207] ([Intel XE#1124]) -> [SKIP][208] ([Intel XE#7825]) +11 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][209] ([Intel XE#7825]) -> [SKIP][210] ([Intel XE#2887]) +15 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][211] ([Intel XE#7825]) -> [SKIP][212] ([Intel XE#3432]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][213] ([Intel XE#7825]) -> [SKIP][214] ([Intel XE#2652]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          [SKIP][215] ([Intel XE#2887]) -> [SKIP][216] ([Intel XE#7825]) +14 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][217] ([Intel XE#2652]) -> [SKIP][218] ([Intel XE#7825]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][219] -> [SKIP][220] ([Intel XE#2724] / [Intel XE#7449])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][221] ([Intel XE#7006]) -> [SKIP][222] ([Intel XE#6969] / [Intel XE#7006])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][223] ([Intel XE#7825]) -> [SKIP][224] ([Intel XE#7642]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@content-type-change.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][225] ([Intel XE#7825]) -> [SKIP][226] ([Intel XE#2390] / [Intel XE#6974])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          [SKIP][227] ([Intel XE#6974]) -> [SKIP][228] ([Intel XE#7825])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][229] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][230] ([Intel XE#7825]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_content_protection@legacy.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][231] ([Intel XE#7825]) -> [FAIL][232] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [SKIP][233] ([Intel XE#7825]) -> [FAIL][234] ([Intel XE#6707] / [Intel XE#7439])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][235] ([Intel XE#7825]) -> [SKIP][236] ([Intel XE#2320]) +7 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][237] ([Intel XE#7825]) -> [SKIP][238] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][239] ([Intel XE#2320]) -> [SKIP][240] ([Intel XE#7825]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][241] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][242] ([Intel XE#7825])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][243] ([Intel XE#7571]) -> [SKIP][244] ([Intel XE#7825])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][245] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][246] ([Intel XE#7825])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][247] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][248] ([Intel XE#7825])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][249] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][250] ([Intel XE#7825])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][251] ([Intel XE#7825]) -> [SKIP][252] ([Intel XE#4354] / [Intel XE#5870])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][253] ([Intel XE#2244]) -> [SKIP][254] ([Intel XE#7825])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_dsc@dsc-basic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][255] ([Intel XE#7825]) -> [SKIP][256] ([Intel XE#2244]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [SKIP][257] ([Intel XE#2316]) -> [FAIL][258] ([Intel XE#3149] / [Intel XE#6266])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][259] ([Intel XE#2482]) -> [FAIL][260] ([Intel XE#5408] / [Intel XE#6266])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][261] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][262] ([Intel XE#7178])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][263] ([Intel XE#2380]) -> [SKIP][264] ([Intel XE#7178] / [Intel XE#7351])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][265] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][266] ([Intel XE#2380])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][267] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][268] ([Intel XE#7178]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][269] ([Intel XE#7178]) -> [SKIP][270] ([Intel XE#7178] / [Intel XE#7351])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][271] ([Intel XE#6314]) -> [SKIP][272] ([Intel XE#2311]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][273] ([Intel XE#2311]) -> [SKIP][274] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +20 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][275] ([Intel XE#6314]) -> [SKIP][276] ([Intel XE#7061] / [Intel XE#7356]) +8 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][277] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][278] ([Intel XE#2311]) +21 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][279] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][280] ([Intel XE#4141]) +11 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][281] ([Intel XE#4141]) -> [SKIP][282] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][283] ([Intel XE#4141]) -> [SKIP][284] ([Intel XE#2312])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][285] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][286] ([Intel XE#6314]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][287] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][288] ([Intel XE#4141]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-bmg:          [SKIP][289] ([Intel XE#4141]) -> [SKIP][290] ([Intel XE#2548] / [Intel XE#6314]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][291] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][292] ([Intel XE#2548] / [Intel XE#6314])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][293] ([Intel XE#2311]) -> [SKIP][294] ([Intel XE#6314])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#2311])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][298] ([Intel XE#2311]) +7 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][299] ([Intel XE#2311]) -> [SKIP][300] ([Intel XE#2548] / [Intel XE#6314]) +5 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][301] ([Intel XE#6314]) -> [SKIP][302] ([Intel XE#2313]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][303] ([Intel XE#2313]) -> [SKIP][304] ([Intel XE#2312]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][305] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][306] ([Intel XE#2312])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#2548] / [Intel XE#6314]) +25 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][309] ([Intel XE#2313]) -> [SKIP][310] ([Intel XE#6314]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][311] ([Intel XE#2312]) -> [SKIP][312] ([Intel XE#2313]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][313] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][314] ([Intel XE#2313]) +28 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][315] ([Intel XE#7825]) -> [SKIP][316] ([Intel XE#3374] / [Intel XE#3544])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#6911] / [Intel XE#7378])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][319] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][320] ([Intel XE#7825])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [SKIP][321] ([Intel XE#7825]) -> [DMESG-FAIL][322] ([Intel XE#5681] / [Intel XE#7725])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_lowres@tiling-x.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][323] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][324] ([Intel XE#7825])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][325] ([Intel XE#7825]) -> [SKIP][326] ([Intel XE#5020] / [Intel XE#7348])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][327] ([Intel XE#6813]) -> [SKIP][328] ([Intel XE#6814] / [Intel XE#7428])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@package-g7.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][329] ([Intel XE#7825]) -> [SKIP][330] ([Intel XE#3904] / [Intel XE#7342])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][331] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][332] ([Intel XE#7825])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][333] ([Intel XE#2413]) -> [SKIP][334] ([Intel XE#7825]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [SKIP][335] ([Intel XE#1435]) -> [FAIL][336] ([Intel XE#6361])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_setmode@basic.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_setmode@basic.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][337] ([Intel XE#6503]) -> [SKIP][338] ([Intel XE#7825]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_sharpness_filter@filter-formats.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          [SKIP][339] ([Intel XE#7825]) -> [SKIP][340] ([Intel XE#6503]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_sharpness_filter@filter-rotations.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][341] ([Intel XE#7825]) -> [SKIP][342] ([Intel XE#2168] / [Intel XE#7444]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_vrr@lobf.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][343] ([Intel XE#1499]) -> [SKIP][344] ([Intel XE#7825]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][345] -> [INCOMPLETE][346] ([Intel XE#6321]) +1 other test incomplete
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][347] -> [SKIP][348] ([Intel XE#7140]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][349] ([Intel XE#7826]) -> [SKIP][350] ([Intel XE#7136]) +16 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][351] ([Intel XE#7136]) -> [SKIP][352] ([Intel XE#7826]) +15 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7079]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7089]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824
  [Intel XE#7825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825
  [Intel XE#7826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826
  [Intel XE#7827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * IGT: IGT_8872 -> IGT_8873
  * Linux: xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e -> xe-pw-165429v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e
  xe-pw-165429v1: 165429v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/index.html

--===============7566649614938125716==
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
<tr><td><b>Series:</b></td><td>vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165429/">https://patchwork.freedesktop.org/series/165429/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_FULL -&gt; xe-pw-165429v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165429v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165429v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165429v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square-userenv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@xe_compute@compute-square-userenv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_compute@compute-square-userenv.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_oa@polling.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_FULL and xe-pw-165429v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic@plane-cursor-legacy@pipe-b-hdmi-a-3:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165429v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_feature_discovery@display-1x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882">Intel XE#4882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_invalid_mode@int-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_plane@planar-pixel-format-settings.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780">Intel XE#7780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane@plane-position-covered.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@xe_eu_stall@invalid-gt-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_eu_stall@unprivileged-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +300 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@pat-sw-hw-compare.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +67 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_color@gamma.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882">Intel XE#4882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_invalid_mode@clock-too-high.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-7efc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_plane_scaling@invalid-parameters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079">Intel XE#7079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089">Intel XE#7089</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_properties@colorop-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_properties@plane-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@xe_eu_stall@non-blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-preempt-fence-early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_compute_mode@many-preempt-fence-early.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_exec_compute_mode@many-preempt-fence-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_reset@cm-cat-error.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@xe_exec_reset@cm-cat-error.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_sip@invalidinstr-walker-enabled.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> +361 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_mmap@pci-membarrier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@false-sharing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@false-sharing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@xe_pat@false-sharing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@xe_sriov_vram@vf-access-provisioned.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681">Intel XE#5681</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-3/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +15 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8872 -&gt; IGT_8873</li>
<li>Linux: xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e -&gt; xe-pw-165429v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e<br />
  xe-pw-165429v1: 165429v1</p>

</body>
</html>

--===============7566649614938125716==--
