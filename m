Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1980BC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 01:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FC410EA35;
	Fri, 17 Jan 2025 01:34:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2F910E5A4;
 Fri, 17 Jan 2025 01:34:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6368617941797541541=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/modeset=3A_Handle_tiled_displays_in_pan=5Fdisplay=5Fatom?=
 =?utf-8?q?ic=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 01:34:37 -0000
Message-ID: <173707767769.487978.10191767110015509107@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116142825.3933-1-dev@lankhorst.se>
In-Reply-To: <20250116142825.3933-1-dev@lankhorst.se>
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

--===============6368617941797541541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/modeset: Handle tiled displays in pan_display_atomic.
URL   : https://patchwork.freedesktop.org/series/143617/
State : failure

== Summary ==

CI Bug Log - changes from xe-2498-50d15a728295807727a2642284d639fc71ecaa15_full -> xe-pw-143617v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143617v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143617v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143617v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] +2 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][10] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][14] ([Intel XE#2316]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [SKIP][16] ([Intel XE#2423]) -> [INCOMPLETE][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_plane_lowres@tiling-x.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_plane_lowres@tiling-x.html

  
Known issues
------------

  Here are the changes found in xe-pw-143617v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#1885])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2423]) +36 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#873])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#3658])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2136]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#316]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1407])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1428])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2191])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#367])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +69 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2669]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][37] ([Intel XE#1727])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][38] ([Intel XE#3113])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2887]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#314]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#308])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2953]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#3321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#3321])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2316])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#301]) +8 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2597])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#3149] / [Intel XE#886])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +3 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2293])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1397] / [Intel XE#1745])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1397])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#651]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#651]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#656]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#653]) +9 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1450] / [Intel XE#2568])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1450]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#361])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2763]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2763]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1129])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2446])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1489]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#3414]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][86] -> [FAIL][87] ([Intel XE#771] / [Intel XE#899])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][88] -> [FAIL][89] ([Intel XE#899])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#2159]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1499])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#756])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1123])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2905]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2905]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-large:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#688])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@xe_evict@evict-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1392]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#1130]) +85 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#288]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#1192])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1420] / [Intel XE#2838])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][106] -> [ABORT][107] ([Intel XE#1358] / [Intel XE#1794])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][108] -> [ABORT][109] ([Intel XE#1358]) +1 other test abort
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][110] -> [ABORT][111] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][112] ([Intel XE#1885]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@read:
    - shard-bmg:          [SKIP][114] ([Intel XE#2134]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@fbdev@read.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@fbdev@read.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][116] ([Intel XE#1033]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][118] ([Intel XE#2136]) -> [PASS][119] +2 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][120] ([Intel XE#3862]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][122] ([Intel XE#877]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][124] ([Intel XE#2291]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][126] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][128] -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][130] ([Intel XE#3321]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][132] ([Intel XE#2625]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][134] ([Intel XE#2423]) -> [PASS][135] +30 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][136] ([Intel XE#886]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     [FAIL][138] ([Intel XE#301]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [INCOMPLETE][140] -> [PASS][141] +3 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][142] ([Intel XE#361]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][144] ([Intel XE#1435]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][146] ([Intel XE#1522]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-6/igt@kms_vrr@flipline.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1392]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-adlp:         [DMESG-WARN][150] ([Intel XE#2953]) -> [PASS][151] +3 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#4045]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@xe_mmap@pci-membarrier-bad-pagesize.html
    - shard-bmg:          [SKIP][154] ([Intel XE#4045]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-5/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [SKIP][178], [PASS][179], [PASS][180], [PASS][181]) ([Intel XE#378]) -> ([PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-434/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][207] ([Intel XE#1358]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          [SKIP][209] ([Intel XE#1130]) -> [PASS][210] +51 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_vm@bind-once.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][211] ([Intel XE#2327]) -> [SKIP][212] ([Intel XE#2136])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][213] ([Intel XE#2136]) -> [SKIP][214] ([Intel XE#2327]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][215] ([Intel XE#1124]) -> [SKIP][216] ([Intel XE#2136]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][217] ([Intel XE#2136]) -> [SKIP][218] ([Intel XE#1124]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][219] ([Intel XE#607]) -> [SKIP][220] ([Intel XE#2136])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][221] ([Intel XE#367]) -> [SKIP][222] ([Intel XE#2423])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][223] ([Intel XE#2423]) -> [SKIP][224] ([Intel XE#367])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][225] ([Intel XE#2136]) -> [SKIP][226] ([Intel XE#2887]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][227] ([Intel XE#3432]) -> [SKIP][228] ([Intel XE#2136])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][229] ([Intel XE#2136]) -> [SKIP][230] ([Intel XE#3432])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][231] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][232] ([Intel XE#2136])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][233] ([Intel XE#2887]) -> [SKIP][234] ([Intel XE#2136]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][235] ([Intel XE#2136]) -> [SKIP][236] ([Intel XE#2724])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_cdclk@plane-scaling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][237] ([Intel XE#2325]) -> [SKIP][238] ([Intel XE#2423]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][239] ([Intel XE#2252]) -> [SKIP][240] ([Intel XE#2423]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][241] ([Intel XE#2423]) -> [SKIP][242] ([Intel XE#2252]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][243] ([Intel XE#1188]) -> [SKIP][244] ([Intel XE#2423])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_content_protection@uevent.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][245] ([Intel XE#2320]) -> [SKIP][246] ([Intel XE#2423]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          [SKIP][247] ([Intel XE#2423]) -> [SKIP][248] ([Intel XE#2320])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][249] ([Intel XE#2321]) -> [SKIP][250] ([Intel XE#2423])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][251] ([Intel XE#877]) -> [SKIP][252] ([Intel XE#2423])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][253] ([Intel XE#2423]) -> [SKIP][254] ([Intel XE#2286])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][255] ([Intel XE#1508]) -> [SKIP][256] ([Intel XE#2136])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][257] ([Intel XE#2244]) -> [SKIP][258] ([Intel XE#2136])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][259] ([Intel XE#2136]) -> [SKIP][260] ([Intel XE#2244])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][261] ([Intel XE#886]) -> [FAIL][262] ([Intel XE#3149] / [Intel XE#886])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2423] / [i915#2575]) -> [SKIP][264] ([i915#2575]) +26 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_flip@busy-flip.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][265] ([Intel XE#2136]) -> [SKIP][266] ([Intel XE#2293] / [Intel XE#2380])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][267] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][268] ([Intel XE#2136]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][269] ([Intel XE#2311]) -> [SKIP][270] ([Intel XE#2136]) +14 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#2311]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][273] ([Intel XE#2136]) -> [SKIP][274] ([Intel XE#2311]) +6 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][275] ([Intel XE#2136]) -> [FAIL][276] ([Intel XE#2333]) +1 other test fail
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][277] ([Intel XE#2333]) -> [SKIP][278] ([Intel XE#2312]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][279] ([Intel XE#2312]) -> [FAIL][280] ([Intel XE#2333])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][281] ([Intel XE#2333]) -> [SKIP][282] ([Intel XE#2136]) +9 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][283] ([Intel XE#2311]) -> [SKIP][284] ([Intel XE#2312]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][286] ([Intel XE#2136] / [Intel XE#2231]) +9 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][287] ([Intel XE#2313]) -> [SKIP][288] ([Intel XE#2136]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][289] ([Intel XE#2350]) -> [SKIP][290] ([Intel XE#2136])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#2313]) +8 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][293] ([Intel XE#2313]) -> [SKIP][294] ([Intel XE#2312]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#2313]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][297] ([Intel XE#2423]) -> [SKIP][298] ([Intel XE#2486])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][299] ([Intel XE#2493]) -> [SKIP][300] ([Intel XE#2423])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][301] ([Intel XE#2423]) -> [SKIP][302] ([Intel XE#2763])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][303] ([Intel XE#2763]) -> [SKIP][304] ([Intel XE#2423]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#870])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][307] ([Intel XE#2505]) -> [SKIP][308] ([Intel XE#2136])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][309] ([Intel XE#2446]) -> [SKIP][310] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][311] ([Intel XE#1489]) -> [SKIP][312] ([Intel XE#2136]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][313] ([Intel XE#2136]) -> [SKIP][314] ([Intel XE#1489]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2231]) +28 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][319] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][320] ([Intel XE#2136]) +8 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][321] ([Intel XE#2423]) -> [SKIP][322] ([Intel XE#3414] / [Intel XE#3904])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][323] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][324] ([Intel XE#2423]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][325] ([Intel XE#2413]) -> [SKIP][326] ([Intel XE#2423])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][327] ([Intel XE#2423]) -> [SKIP][328] ([Intel XE#1435])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1500]) -> [SKIP][330] ([Intel XE#362])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][331] ([Intel XE#1499]) -> [SKIP][332] ([Intel XE#2423])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_vrr@flip-suspend.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][333] ([Intel XE#2423]) -> [SKIP][334] ([Intel XE#1499])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_vrr@flipline.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          [SKIP][335] ([Intel XE#1130]) -> [SKIP][336] ([Intel XE#2905]) +4 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_eudebug_online@basic-breakpoint.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          [SKIP][337] ([Intel XE#2905]) -> [SKIP][338] ([Intel XE#1130]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          [SKIP][339] ([Intel XE#1130]) -> [SKIP][340] ([Intel XE#2322]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][341] ([Intel XE#2322]) -> [SKIP][342] ([Intel XE#1130]) +4 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][343] ([Intel XE#1130]) -> [SKIP][344] ([Intel XE#2248])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][345] ([Intel XE#2284]) -> [SKIP][346] ([Intel XE#1130])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#944])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][349] ([Intel XE#944]) -> [SKIP][350] ([Intel XE#1130])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2498-50d15a728295807727a2642284d639fc71ecaa15 -> xe-pw-143617v1

  IGT_8195: 8195
  xe-2498-50d15a728295807727a2642284d639fc71ecaa15: 50d15a728295807727a2642284d639fc71ecaa15
  xe-pw-143617v1: 143617v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/index.html

--===============6368617941797541541==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/modeset: Hand=
le tiled displays in pan_display_atomic.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143617/">https://patchwork.freedesktop.org/series/143617/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143617v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143617v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2498-50d15a728295807727a2642284d639fc7=
1ecaa15_full -&gt; xe-pw-143617v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143617v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143617v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1436=
17v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-2/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg=
-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">IN=
COMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_fl=
ip@2x-blocking-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v=
1/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@c=
d-hdmi-a6-dp4.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x.h=
tml">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_plane_lowres@tiling-x@pip=
e-b-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@xe_liv=
e_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf=
.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-=
bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_plane_low=
res@tiling-x.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143617v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@core_hot=
unplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@core_hotunplug@unplug-re=
scan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_addf=
b_basic@invalid-smem-bo-on-discrete.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_addfb=
_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +36 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bm=
g-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edi=
d-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_content_protection@atom=
ic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rando=
m-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-8/igt@kms_c=
ursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms=
_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-c=
heck.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-5/igt@kms_flip=
@plain-flip-ts-check@c-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-1/igt@kms_flip@plain-fl=
ip-ts-check@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@=
kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_pm_r=
pm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_uni=
versal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-9/igt@kms_universal_pl=
ane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-adlp-9/igt@=
kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143617v1/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@xe_eudebug@sysfs-toggle.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_eudebug_online@interrupt=
-other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@xe_evict@evict-large.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"=
>Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@xe_exec_=
fault_mode@many-bindexecqueue-imm.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_exec_fau=
lt_mode@many-bindexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +85 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143617v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143617v1/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_pm@=
s3-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_pm@=
s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-ex=
ec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-3/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143617v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@core_hot=
unplug@hotreplug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@core_hotunplug=
@hotreplug.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@fbdev@re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@fbdev@read.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143617v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-=
bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/=
shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/sha=
rd-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143617v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143617v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-=
463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-1/igt@kms_flip=
@blocking-wf_vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-6/igt@kms_fl=
ip@blocking-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-7/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-5/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/sh=
ard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-6/igt@kms_vrr@=
flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1522">Intel XE#1522</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-8/igt@kms_vrr@flipline.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143617v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Int=
el XE#2953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143617v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-funct=
ion-xe_guc_log_init.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_mma=
p@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt=
@xe_mmap@pci-membarrier-bad-pagesize.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-3/igt@xe_mmap@=
pci-membarrier-bad-pagesize.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-5/igt@xe_=
mmap@pci-membarrier-bad-pagesize.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71=
ecaa15/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d6=
39fc71ecaa15/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a26=
42284d639fc71ecaa15/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807=
727a2642284d639fc71ecaa15/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728=
295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d=
15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-24=
98-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639fc71ec=
aa15/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a2642284d639=
fc71ecaa15/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727a26422=
84d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295807727=
a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a728295=
807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-50d15a=
728295807727a2642284d639fc71ecaa15/shard-dg2-436/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2498-=
50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-463/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143617v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3617v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/sh=
ard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-433/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143617v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43617v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143617v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-463/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143617v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143617v1/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-432/igt@xe_pm@=
s2idle-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-464/igt@xe_p=
m@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_vm@bi=
nd-once.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@xe_vm@bind-once.html">P=
ASS</a> +51 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_big_=
fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms=
_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143617v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-=
7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_bw@l=
inear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/=
igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bm=
g-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2=
887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard=
-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/sh=
ard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_cham=
elium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/s=
hard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_cham=
elium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/ig=
t@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_curs=
or_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_=
cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_curs=
or_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/=
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143617v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-t=
ransitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143617v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-lnl-1/igt@kms_flip=
@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-lnl-6/igt@kms_flip@bloc=
king-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_fl=
ip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt@km=
s_flip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143617v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bp=
p-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143617v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb=
-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43617v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43617v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-=
draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43617v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/sha=
rd-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43617v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
17v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
617v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143617v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-do=
wnscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
617v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-ex=
ceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3617v1/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed=
-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-433/igt@kms_ps=
r@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-dg2-432/igt=
@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7=
/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#390=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
617v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/=
igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@kms_vrr@=
flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@kms_vrr@flipline.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-7/igt@xe_eudeb=
ug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-8/igt@xe_e=
udebug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-=
bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_exec_=
basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@x=
e_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
617v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_oa@un=
privileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/ig=
t@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-4/igt@xe_pm@s4=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7/igt@xe_pm@s4-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-1/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-4/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2498-50d15a728295807727a2642284d639fc71ecaa15/shard-bmg-8/igt@xe_query=
@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143617v1/shard-bmg-7=
/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2498-50d15a728295807727a2642284d639fc71ecaa15 -&gt; xe-pw-143=
617v1</li>
</ul>
<p>IGT_8195: 8195<br />
  xe-2498-50d15a728295807727a2642284d639fc71ecaa15: 50d15a728295807727a2642=
284d639fc71ecaa15<br />
  xe-pw-143617v1: 143617v1</p>

</body>
</html>

--===============6368617941797541541==--
