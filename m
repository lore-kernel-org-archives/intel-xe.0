Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49980C87FDA
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 09:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430710E4F3;
	Mon,  4 Aug 2025 09:09:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4010E4F3;
 Mon,  4 Aug 2025 09:09:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1970952826637975305=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Wait_PSR_idle_before_on_ds?=
 =?utf-8?q?b_commit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Aug 2025 09:09:08 -0000
Message-ID: <175429854871.209534.17995242347471903548@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250804061615.932508-1-jouni.hogander@intel.com>
In-Reply-To: <20250804061615.932508-1-jouni.hogander@intel.com>
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

--===============1970952826637975305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Wait PSR idle before on dsb commit
URL   : https://patchwork.freedesktop.org/series/152470/
State : failure

== Summary ==

CI Bug Log - changes from xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb_FULL -> xe-pw-152470v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152470v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152470v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152470v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-lnl:          [PASS][3] -> [ABORT][4] +21 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-adlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-4/igt@xe_exec_threads@threads-cm-fd-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_threads@threads-cm-fd-basic.html

  
#### Warnings ####

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][7] ([Intel XE#2893] / [Intel XE#4608]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          [SKIP][9] ([Intel XE#4608]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-152470v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#4963]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#5715])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@core_setmaster@master-drop-set-shared-fd.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@fbdev@nullptr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#5177])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@intel_hwmon@hwmon-read.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#911]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#4947]) +26 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#4543]) +7 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#607])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4950])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2191])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#787]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +181 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2907])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2907]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#2705] / [Intel XE#4212])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#3124])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4417]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@kms_chamelium_color@ctm-0-75.html
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1178]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#1178])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#307])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#308]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#455]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1424])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][56] -> [DMESG-WARN][57] ([Intel XE#5354])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-lnl:          [PASS][58] -> [TIMEOUT][59] ([Intel XE#1727])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#4633])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][62] -> [ABORT][63] ([Intel XE#1727]) +1 other test abort
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1508])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#3009])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_dp_aux_dev.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4354])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#4422])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#301] / [Intel XE#3149])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#301])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][75] -> [DMESG-WARN][76] ([Intel XE#4543]) +15 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#4543] / [Intel XE#5208])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][79] -> [DMESG-WARN][80] ([Intel XE#5208])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2380])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#651])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#651])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#5390]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4947]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651]) +17 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#653]) +14 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#656]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#656]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2313])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4298])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#4596])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#5020])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-adlp:         [PASS][99] -> [DMESG-WARN][100] ([Intel XE#2953] / [Intel XE#4173])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2763]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1122])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#3309])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#3309])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#718])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#4962]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_pm_rpm@i2c.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#4950]) +101 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1489]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2893])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1489])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#4608])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1406])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_psr@psr-primary-blt.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4837])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1392])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#1392]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1392] / [Intel XE#5575])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-null.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1392])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#288] / [Intel XE#5561])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#288]) +13 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2360])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#3876])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-bmg:          [PASS][129] -> [DMESG-WARN][130] ([Intel XE#3876])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][131] ([Intel XE#3876])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4837]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#4915] / [Intel XE#5560]) +14 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4915]) +125 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4945]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-adlp:         [PASS][136] -> [DMESG-FAIL][137] ([Intel XE#3876])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2229])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#560])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][140] -> [FAIL][141] ([Intel XE#5679])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_module_load@many-reload.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#3573]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#3573])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-2/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][144] ([Intel XE#1173])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#4733] / [Intel XE#5594])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][147] -> [SKIP][148] ([Intel XE#4945]) +517 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-bmg:          [FAIL][149] ([Intel XE#4672]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@core_getversion@basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][151] ([Intel XE#4963]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][153] ([Intel XE#4674]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][155] ([Intel XE#5547]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][157] ([Intel XE#2134]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@fbdev@unaligned-write.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@fbdev@unaligned-write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][159] ([Intel XE#4665]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1}:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#4543]) -> [PASS][162] +7 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-8/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][163] ([Intel XE#3884]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [FAIL][165] ([Intel XE#1874]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][167] ([Intel XE#4543]) -> [PASS][168] +6 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][169] ([Intel XE#4947]) -> [PASS][170] +21 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#3862]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][173] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][175] ([Intel XE#2291]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][177] ([Intel XE#4354]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][179] ([Intel XE#4950]) -> [PASS][180] +90 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#4208]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][183] ([Intel XE#1503]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][187] ([Intel XE#718]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][189] ([Intel XE#4962]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1392]) -> [PASS][192] +4 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [SKIP][193] ([Intel XE#4945]) -> [PASS][194] +406 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][195] ([Intel XE#2229]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [SKIP][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222]) ([Intel XE#378]) -> ([PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-3/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-3/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][248] ([Intel XE#873]) -> [SKIP][249] ([Intel XE#4950])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][250] ([Intel XE#4947]) -> [SKIP][251] ([Intel XE#2327]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][252] ([Intel XE#2327]) -> [SKIP][253] ([Intel XE#4947]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][254] ([Intel XE#4947]) -> [SKIP][255] ([Intel XE#607])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][256] ([Intel XE#4947]) -> [SKIP][257] ([Intel XE#610]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][258] ([Intel XE#1124]) -> [SKIP][259] ([Intel XE#4947]) +13 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][260] ([Intel XE#4947]) -> [SKIP][261] ([Intel XE#1124]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][262] ([Intel XE#4950]) -> [SKIP][263] ([Intel XE#2314] / [Intel XE#2894])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][264] ([Intel XE#367]) -> [SKIP][265] ([Intel XE#4950]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][266] ([Intel XE#4950]) -> [SKIP][267] ([Intel XE#367])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][268] ([Intel XE#2887]) -> [SKIP][269] ([Intel XE#4947]) +20 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][270] ([Intel XE#4947]) -> [SKIP][271] ([Intel XE#2887]) +14 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][272] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][273] ([Intel XE#4947])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][274] ([Intel XE#4947]) -> [SKIP][275] ([Intel XE#3432])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][276] ([Intel XE#3432]) -> [SKIP][277] ([Intel XE#4947])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][278] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][279] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][280] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][281] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][282] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [DMESG-WARN][283] ([Intel XE#1727] / [Intel XE#3113])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][284] ([Intel XE#4947]) -> [SKIP][285] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][286] ([Intel XE#2724]) -> [SKIP][287] ([Intel XE#4947]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][288] ([Intel XE#2325]) -> [SKIP][289] ([Intel XE#4950]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][290] ([Intel XE#4950]) -> [SKIP][291] ([Intel XE#2325]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][292] ([Intel XE#4950]) -> [SKIP][293] ([Intel XE#2252]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][294] ([Intel XE#2252]) -> [SKIP][295] ([Intel XE#4950]) +12 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][296] ([Intel XE#4950]) -> [FAIL][297] ([Intel XE#1178])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][298] ([Intel XE#2341]) -> [SKIP][299] ([Intel XE#4950]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][300] ([Intel XE#4950]) -> [SKIP][301] ([Intel XE#2390])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][302] ([Intel XE#1178]) -> [SKIP][303] ([Intel XE#4950])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_content_protection@srm.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][304] ([Intel XE#4950]) -> [SKIP][305] ([Intel XE#2320]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cursor_crc@cursor-random-64x21.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][306] ([Intel XE#2320]) -> [SKIP][307] ([Intel XE#4950]) +4 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][308] ([Intel XE#4950]) -> [SKIP][309] ([Intel XE#2321])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][310] ([Intel XE#2291]) -> [SKIP][311] ([Intel XE#4950])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][312] ([Intel XE#2286]) -> [SKIP][313] ([Intel XE#4950])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][314] ([Intel XE#4950]) -> [SKIP][315] ([Intel XE#2286])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][316] ([Intel XE#2244]) -> [SKIP][317] ([Intel XE#4947])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][318] ([Intel XE#4947]) -> [SKIP][319] ([Intel XE#5425])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][320] ([Intel XE#776]) -> [SKIP][321] ([Intel XE#4947])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][322] ([Intel XE#4950]) -> [SKIP][323] ([Intel XE#2372])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][324] ([Intel XE#4950]) -> [SKIP][325] ([Intel XE#1138])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][326] ([Intel XE#2374]) -> [SKIP][327] ([Intel XE#4950])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_feature_discovery@psr2.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][328] ([Intel XE#2316]) -> [SKIP][329] ([Intel XE#4950])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][330] ([Intel XE#4950]) -> [SKIP][331] ([Intel XE#2316])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][332] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][333] ([Intel XE#4543]) +1 other test dmesg-warn
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          [INCOMPLETE][334] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][335] ([Intel XE#4950])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][336] ([Intel XE#4947]) -> [SKIP][337] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][338] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][339] ([Intel XE#4947]) +6 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][340] ([Intel XE#4947]) -> [SKIP][341] ([Intel XE#2380])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#2311]) -> [SKIP][343] ([Intel XE#4947]) +37 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#4947]) -> [SKIP][345] ([Intel XE#2312]) +5 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][346] ([Intel XE#4947]) -> [SKIP][347] ([Intel XE#2311]) +29 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][348] ([Intel XE#4947]) -> [SKIP][349] ([Intel XE#5390]) +8 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][350] ([Intel XE#5427]) -> [SKIP][351] ([Intel XE#4947])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][352] ([Intel XE#2312]) -> [SKIP][353] ([Intel XE#4947])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][354] ([Intel XE#2312]) -> [SKIP][355] ([Intel XE#5390])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][356] ([Intel XE#5390]) -> [SKIP][357] ([Intel XE#2312]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][358] ([Intel XE#5390]) -> [SKIP][359] ([Intel XE#4947]) +16 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][360] ([Intel XE#4947]) -> [SKIP][361] ([Intel XE#2352])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][362] ([Intel XE#2312]) -> [SKIP][363] ([Intel XE#2311]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][364] ([Intel XE#2311]) -> [SKIP][365] ([Intel XE#2312]) +7 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][366] ([Intel XE#2313]) -> [SKIP][367] ([Intel XE#2312]) +4 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][368] ([Intel XE#4947]) -> [SKIP][369] ([Intel XE#5672])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][370] ([Intel XE#4947]) -> [SKIP][371] ([Intel XE#2350])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][372] ([Intel XE#2313]) -> [SKIP][373] ([Intel XE#4947]) +43 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][374] ([Intel XE#4947]) -> [SKIP][375] ([Intel XE#2313]) +31 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][376] ([Intel XE#2312]) -> [SKIP][377] ([Intel XE#2313])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][378] ([Intel XE#4950]) -> [SKIP][379] ([Intel XE#1503])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_hdr@static-swap.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][380] ([Intel XE#4947]) -> [SKIP][381] ([Intel XE#346])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][382] ([Intel XE#2501]) -> [SKIP][383] ([Intel XE#4950])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][384] ([Intel XE#2486]) -> [SKIP][385] ([Intel XE#4950])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][386] ([Intel XE#4950]) -> [SKIP][387] ([Intel XE#2486])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][388] ([Intel XE#4329]) -> [SKIP][389] ([Intel XE#4947])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][390] ([Intel XE#5021]) -> [SKIP][391] ([Intel XE#4596])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][392] ([Intel XE#5021]) -> [SKIP][393] ([Intel XE#4950])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][394] ([Intel XE#5020]) -> [SKIP][395] ([Intel XE#4950])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][396] ([Intel XE#4950]) -> [SKIP][397] ([Intel XE#2763])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][398] ([Intel XE#2763]) -> [SKIP][399] ([Intel XE#4950])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][400] ([Intel XE#4947]) -> [SKIP][401] ([Intel XE#870]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][402] ([Intel XE#4947]) -> [SKIP][403] ([Intel XE#3309])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][404] ([Intel XE#4962]) -> [SKIP][405] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][406] ([Intel XE#4962]) -> [SKIP][407] ([Intel XE#1439] / [Intel XE#836])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][408] ([Intel XE#1489]) -> [SKIP][409] ([Intel XE#4947]) +9 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][410] ([Intel XE#4947]) -> [SKIP][411] ([Intel XE#1489]) +6 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][412] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][413] ([Intel XE#4947]) +17 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          [SKIP][414] ([Intel XE#4947]) -> [SKIP][415] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][416] ([Intel XE#4950]) -> [SKIP][417] ([Intel XE#3414] / [Intel XE#3904])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][418] ([Intel XE#2330]) -> [SKIP][419] ([Intel XE#4950]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][420] ([Intel XE#2413]) -> [SKIP][421] ([Intel XE#4950])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][422] ([Intel XE#4950]) -> [SKIP][423] ([Intel XE#1435])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][424] ([Intel XE#4950]) -> [SKIP][425] ([Intel XE#2426])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][426] ([Intel XE#4950]) -> [SKIP][427] ([Intel XE#1499])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_vrr@flip-dpms.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][428] ([Intel XE#1499]) -> [SKIP][429] ([Intel XE#4950]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_vrr@flip-suspend.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][430] ([Intel XE#2168]) -> [SKIP][431] ([Intel XE#4950]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_vrr@lobf.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][432] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][433] ([Intel XE#4950])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][434] ([Intel XE#4950]) -> [SKIP][435] ([Intel XE#1091] / [Intel XE#2849])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][436] ([Intel XE#4837]) -> [SKIP][437] ([Intel XE#4945]) +15 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][438] ([Intel XE#2322]) -> [SKIP][439] ([Intel XE#4945]) +10 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][440] ([Intel XE#4945]) -> [SKIP][441] ([Intel XE#2322]) +10 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#1392]) -> [INCOMPLETE][443] ([Intel XE#4842])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          [SKIP][444] ([Intel XE#4945]) -> [SKIP][445] ([Intel XE#4837]) +10 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][446] ([Intel XE#4943]) -> [SKIP][447] ([Intel XE#4945]) +34 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][448] ([Intel XE#4945]) -> [SKIP][449] ([Intel XE#4943]) +21 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][450] ([Intel XE#4945]) -> [ABORT][451] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [ABORT][452] ([Intel XE#5530]) -> [SKIP][453] ([Intel XE#4945])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][454] ([Intel XE#4945]) -> [SKIP][455] ([Intel XE#586])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_mmap@small-bar.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][456] ([Intel XE#2248]) -> [SKIP][457] ([Intel XE#4945])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#1061]) -> [FAIL][459] ([Intel XE#1173])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_peer2peer@write.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][460] ([Intel XE#5694]) -> [SKIP][461] ([Intel XE#4945])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_pm@d3cold-i2c.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][462] ([Intel XE#2284]) -> [SKIP][463] ([Intel XE#4945]) +3 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_pm@d3cold-mocs.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][464] ([Intel XE#4945]) -> [SKIP][465] ([Intel XE#5695])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [SKIP][466] ([Intel XE#4650]) -> [SKIP][467] ([Intel XE#4945]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][468] ([Intel XE#4733]) -> [SKIP][469] ([Intel XE#4945]) +4 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][470] ([Intel XE#4945]) -> [SKIP][471] ([Intel XE#4733]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][472] ([Intel XE#944]) -> [SKIP][473] ([Intel XE#4945])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_query@multigpu-query-config.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][474] ([Intel XE#4945]) -> [SKIP][475] ([Intel XE#944]) +3 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][476] ([Intel XE#4130]) -> [SKIP][477] ([Intel XE#4945])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][478] ([Intel XE#4945]) -> [SKIP][479] ([Intel XE#4130]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][480] ([Intel XE#3342]) -> [SKIP][481] ([Intel XE#4945]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5715
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8482 -> IGT_8483
  * Linux: xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb -> xe-pw-152470v1

  IGT_8482: 8482
  IGT_8483: 8483
  xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb: 88abc8239a17ea427f6d6bef8f9807fde5bf7cfb
  xe-pw-152470v1: 152470v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/index.html

--===============1970952826637975305==
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
<tr><td><b>Series:</b></td><td>Wait PSR idle before on dsb commit</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152470/">https://patchwork.freedesktop.org/series/152470/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152470v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152470v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3499-88abc8239a17ea427f6d6bef8f9807fde=
5bf7cfb_FULL -&gt; xe-pw-152470v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152470v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152470v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1524=
70v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@kms_curs=
or_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/ig=
t@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</=
a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">ABORT</a> +21 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-4/igt@xe_exec=
_threads@threads-cm-fd-basic.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_threads=
@threads-cm-fd-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Int=
el XE#4608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152470v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-co=
ntinuous-sf.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-2/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Inte=
l XE#4608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152470v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-con=
tinuous-sf@pipe-a-edp-1.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152470v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@core_hot=
unplug@hotunbind-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@core_hotunplug@hotunb=
ind-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4963">Intel XE#4963</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5715">Intel XE#5715</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@fbdev@nu=
llptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152470v1/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/517=
7">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2470v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_big_=
fb@x-tiled-addfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-3/igt@kms_ccs@bad-aux-stride-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_content_protection@atom=
ic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shar=
d-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-siz=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@kms_curs=
or_legacy@cursora-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@kms_c=
ursor_legacy@cursora-vs-flipa-varying-size.html">TIMEOUT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_cursor_le=
gacy@flip-vs-cursor-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-3=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_fli=
p@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-3/igt@kms_flip@fli=
p-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-3/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152470v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-4/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/sh=
ard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor=
-0-25.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_pm_r=
pm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_prop=
erties@connector-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_proper=
ties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +101 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_psr@psr-primary-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@xe_eudebug_online@interrupt-a=
ll-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-ex=
ec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-4/igt@xe_exec_fault_mode@many-exec=
queues-basic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-3/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@xe_exec_=
reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@xe_exec_reset@paralle=
l-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-r=
eset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpo=
int-waitsip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eoche=
ck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE=
#5560</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_exec_system_allocator@thre=
ads-many-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@xe_exec=
_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_exec_=
threads@threads-bal-mixed-fd-basic.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5679">Intel XE#5679</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-2/igt@xe_oa@oa-unit-exclusive-stre=
am-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152470v1/shard-adlp-8/igt@xe_pxp@pxp-termination-key-u=
pdate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@x=
e_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) +517 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@core_get=
version@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@core_getversion@b=
asic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@core_hot=
unplug@hotunplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@core_ho=
tunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@core_set=
master@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@cor=
e_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@device_r=
eset@unbind-reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5547">Intel XE#5547</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@device=
_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@fbdev@un=
aligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@fbdev@unaligned-w=
rite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-dpms@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/=
shard-adlp-6/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1.html">PASS=
</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-adlp-=
6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-=
adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152470v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7=
/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +21 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152470v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +90 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Int=
el XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152470v1/shard-adlp-9/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms=
_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/=
igt@xe_exec_basic@multigpu-no-exec-basic.html">PASS</a> +4 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc=
-race.html">PASS</a> +406 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@xe_live_ktest@xe_bo=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf=
7cfb/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fd=
e5bf7cfb/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f98=
07fde5bf7cfb/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef=
8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d=
6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea42=
7f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17=
ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc823=
9a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88ab=
c8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-=
88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-=
lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cf=
b/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152470v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>)</l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_big_=
fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_=
big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg=
-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2470v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/sh=
ard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_bw@l=
inear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/=
igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-=
5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a=
>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard=
-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-=
bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-463/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-464/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shar=
d-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_chamel=
ium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cham=
elium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/=
igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_curs=
or_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_=
cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@k=
ms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/=
shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_fbcon_fbt@p=
sr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms=
_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/s=
hard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +1 other test dmesg-warn</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel=
 XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152470v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-=
yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE=
#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152470v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-=
bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms=
_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52470v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@k=
ms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2470v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@k=
ms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2470v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_hdr@static-swap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bm=
g-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4=
950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_pane=
l_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-7/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg=
-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
70v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-8/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_pm_rpm@dpms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard=
-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_psr@=
fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/ig=
t@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr@=
fbc-psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_psr@fbc-psr2=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@k=
ms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-=
5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/=
igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-1/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_vrr@=
flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-3/igt@kms_vrr@flip-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Int=
el XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@sriov_ba=
sic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shar=
d-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a=
>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@sriov_ba=
sic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shar=
d-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">In=
tel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@xe_eudeb=
ug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-=
bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-=
5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-=
435/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE=
#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_=
sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-b=
mg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE=
#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#494=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
470v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-n=
omemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4945">Intel XE#4945</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152470v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-v=
m-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/s=
hard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v=
1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-2/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-dg2-435/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_pm@d3cold-mocs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-6/igt@xe_pm@d3hot-i2c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569=
5">Intel XE#5695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_pxp@p=
xp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg=
-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bm=
g-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4=
733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_query=
@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_query@m=
ultigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-4/igt@xe_qu=
ery@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@xe_sriov=
_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5=
/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel X=
E#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152470v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovisio=
n-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152470v1/shard-bmg-5/igt@xe_sriov_flr=
@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8482 -&gt; IGT_8483</li>
<li>Linux: xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb -&gt; xe-pw-152=
470v1</li>
</ul>
<p>IGT_8482: 8482<br />
  IGT_8483: 8483<br />
  xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb: 88abc8239a17ea427f6d6be=
f8f9807fde5bf7cfb<br />
  xe-pw-152470v1: 152470v1</p>

</body>
</html>

--===============1970952826637975305==--
