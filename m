Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DF5C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 09:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411B10E5A5;
	Wed, 15 Jan 2025 09:58:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620F510E49D;
 Wed, 15 Jan 2025 09:58:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5330920824903350483=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe3=3A_Generate_and?=
 =?utf-8?q?_store_the_L3_bank_mask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 09:58:27 -0000
Message-ID: <173693510738.3905205.4095289374949569346@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250114203853.35055-1-matthew.s.atwood@intel.com>
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

--===============5330920824903350483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Generate and store the L3 bank mask
URL   : https://patchwork.freedesktop.org/series/143531/
State : failure

== Summary ==

CI Bug Log - changes from xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6_full -> xe-pw-143531v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143531v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143531v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143531v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@core_hotunplug@hotreplug.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][8] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][9] +13 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html

  
Known issues
------------

  Here are the changes found in xe-pw-143531v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          NOTRUN -> [ABORT][10] ([Intel XE#3914])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#827])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550]) +23 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#3884])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3279])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][17] ([Intel XE#1725])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#610])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +9 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +153 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][34] ([Intel XE#3876])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][35] ([Intel XE#3890])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3432]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#787]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1152]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2325])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1178])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#3278])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1188]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#308]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2320])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2321])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#309]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#309]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2291]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2286])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3070])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2244])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2244])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1135])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#2882]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1421]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#310])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@b-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@b-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@kms_flip@blocking-wf_vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#301]) +4 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#301]) +2 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293] / [Intel XE#2380])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#1033])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([i915#5274])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +26 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2311]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][89] ([Intel XE#2050])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#2333]) +2 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +23 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#656]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1469])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#651]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#651]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#653])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +28 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2313]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#605])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1503])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#346])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#346])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2925])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2934])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][105] ([Intel XE#616]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2493])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][107] -> [FAIL][108] ([Intel XE#361])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2763]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2763]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][113] ([Intel XE#1430])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2893]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1489]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1489])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1489]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1122]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1128])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#3414] / [Intel XE#3904])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1127])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1127])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2330])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3414] / [Intel XE#3904])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1435]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1500])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#330])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#877]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1499])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#455]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#756])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1126])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2905]) +11 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2905]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][142] -> [FAIL][143] ([Intel XE#1600])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#688]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][145] -> [TIMEOUT][146] ([Intel XE#1473])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2322]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1392]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][149] -> [SKIP][150] ([Intel XE#1392]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#288]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#288]) +20 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2905]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][154] -> [SKIP][155] ([Intel XE#1192])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1192])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4045])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_mmap@pci-membarrier-bad-object.html
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4045])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183]) -> ([PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [SKIP][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209]) ([Intel XE#378])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][210] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#2284] / [Intel XE#366])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#1948])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][213] -> [ABORT][214] ([Intel XE#1358] / [Intel XE#1794])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_pm@s2idle-mocs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][215] -> [ABORT][216] ([Intel XE#1358]) +1 other test abort
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#2284] / [Intel XE#366])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][218] -> [ABORT][219] ([Intel XE#1358] / [Intel XE#1794])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-6/igt@xe_pm@s4-mocs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][220] -> [ABORT][221] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][222] -> [FAIL][223] ([Intel XE#958])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#944])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#944])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#944]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#944]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][228] -> [DMESG-WARN][229] ([Intel XE#2953]) +8 other tests dmesg-warn
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@xe_wedged@basic-wedged.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][230] ([Intel XE#1033]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][232] ([Intel XE#3908]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][234] ([Intel XE#3908]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][236] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][238] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][240] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][242] ([Intel XE#3124]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][244] ([Intel XE#2291]) -> [PASS][245] +3 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][246] ([Intel XE#877]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][248] ([Intel XE#2425]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][250] ([Intel XE#3009]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_dp_aux_dev.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][252] ([Intel XE#2882]) -> [PASS][253] +3 other tests pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][254] -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][256] ([Intel XE#2316]) -> [PASS][257] +5 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [FAIL][258] ([Intel XE#2882]) -> [PASS][259] +2 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-8/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-adlp:         [FAIL][260] ([Intel XE#886]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-8/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][262] ([Intel XE#2882] / [Intel XE#3820]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][264] ([Intel XE#3820]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][266] ([Intel XE#301]) -> [PASS][267] +2 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [INCOMPLETE][268] ([Intel XE#2049]) -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - shard-lnl:          [FAIL][270] ([Intel XE#886]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][272] ([Intel XE#1874]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][274] ([Intel XE#1033]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][276] ([Intel XE#361]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][278] ([Intel XE#899]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [ABORT][280] ([Intel XE#2625] / [Intel XE#4057]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][282] -> [PASS][283] +1 other test pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][284] ([Intel XE#1473]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#1392]) -> [PASS][287] +4 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][288] ([Intel XE#2953]) -> [PASS][289] +2 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][290] ([Intel XE#1192]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][292] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][294] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][295] +2 other tests pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [DMESG-WARN][296] ([Intel XE#1033]) -> [DMESG-FAIL][297] ([Intel XE#1033])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][298] ([Intel XE#2341]) -> [FAIL][299] ([Intel XE#1178])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][300] ([Intel XE#2312]) -> [SKIP][301] ([Intel XE#2311]) +14 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][302] ([Intel XE#2311]) -> [SKIP][303] ([Intel XE#2312]) +10 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][304] ([Intel XE#2333]) -> [SKIP][305] ([Intel XE#2312]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][306] ([Intel XE#2312]) -> [FAIL][307] ([Intel XE#2333]) +5 other tests fail
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][308] ([Intel XE#2312]) -> [SKIP][309] ([Intel XE#2313]) +13 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][310] ([Intel XE#2313]) -> [SKIP][311] ([Intel XE#2312]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][312] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][313] ([Intel XE#3544])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][314] ([Intel XE#1473]) -> [INCOMPLETE][315] ([Intel XE#1473])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [FAIL][316] ([Intel XE#1000]) -> [TIMEOUT][317] ([Intel XE#1473])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][318] ([Intel XE#1473]) -> [FAIL][319] ([Intel XE#1000])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [FAIL][320] ([Intel XE#1000]) -> [TIMEOUT][321] ([Intel XE#1473] / [Intel XE#2472])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [DMESG-FAIL][322] ([Intel XE#4060]) -> [TIMEOUT][323] ([Intel XE#1473] / [Intel XE#2472])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [INCOMPLETE][324] ([Intel XE#1473]) -> [TIMEOUT][325] ([Intel XE#1473] / [Intel XE#2472])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict@evict-threads-large.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#4060]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4060
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6 -> xe-pw-143531v1

  IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6: 61e0f64bde73d48e3dc204c129c25e0a15f0d4e6
  xe-pw-143531v1: 143531v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/index.html

--===============5330920824903350483==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Generate and store the L3 bank m=
ask</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143531/">https://patchwork.freedesktop.org/series/143531/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143531v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143531v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2487-61e0f64bde73d48e3dc204c129c25e0a1=
5f0d4e6_full -&gt; xe-pw-143531v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143531v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143531v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1435=
31v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@core_h=
otunplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@core_hotunplug@hotreplug=
.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-8/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143531v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb=
.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-=
read-crc@pipe-d-hdmi-a-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_vm@mmap-style-bind-either-=
side-partial-large-page-hammer.html">DMESG-WARN</a> +13 other tests dmesg-w=
arn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143531v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@core_hotunplug@hotunplug-resc=
an.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/sha=
rd-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) =
+23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-8/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-4/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotat=
e-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-c-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3890">Intel XE#3890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-4=
-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">In=
tel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard=
-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_content_protection@srm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_flip@2x-plai=
n-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@kms_flip=
@blocking-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@kms_flip@blocking-=
wf_vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_force_connector_basic@p=
rune-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-blt.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-move.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +23 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_hdr@static-swap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/=
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#=
361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">=
Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_psr@pr-cursor-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_psr@psr2-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_vbla=
nk@ts-continuation-modeset-hang@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/i=
gt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_writeback@writeback-fb-=
id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-me=
tadata-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_eudebug_online@interrupt-r=
econnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_evi=
ct@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_evict@ev=
ict-beng-large-multi-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_evi=
ct@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_evict@=
evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exe=
c-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-=
dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@xe_live_=
ktest@xe_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
2">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_mmap@pci-membarrier-bad-=
object.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4045">Intel XE#4045</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_mmap@pci-membarrier-bad-ob=
ject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard=
-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15=
f0d4e6/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c2=
5e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc20=
4c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48=
e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bd=
e73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e=
0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-24=
87-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0=
d4e6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e=
0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c1=
29c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3d=
c204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73=
d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f6=
4bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-=
61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43531v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143531v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2=
-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143531v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_oa@non-privileged-map-oa=
-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_pm@=
s2idle-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">In=
tel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_pm@=
s3-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358=
">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-6/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143531v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"=
>Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind=
-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@xe_pm_re=
sidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@xe_pm_residency@toggle-g=
t-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_query@multigpu-query-gt-l=
ist.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@xe_wedg=
ed@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143531v1/shard-adlp-4/igt@xe_wedged@basic-wedged.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2953">Intel XE#2953</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip=
-atomic@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3908">Intel XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/=
shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143531v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel =
XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pi=
pe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-b=
mg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +3 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-t=
ransitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>=
 +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_fli=
p@blocking-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-8/i=
gt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_fli=
p@blocking-wf_vblank@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-8/igt@k=
ms_flip@blocking-wf_vblank@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
31v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1=
/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434=
/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-7/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-=
1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@kms_flip=
@wf_vblank-ts-check-interruptible@b-edp1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-ln=
l-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
31v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-=
dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-3/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl=
-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@kms_vb=
lank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v=
1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@kms_vb=
lank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard=
-dg2-464/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_evi=
ct@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434=
/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-=
dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel=
 XE#2953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143531v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_wopcm_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_live_ktest@=
xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-9/igt@xe_pm@s=
4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/s=
hard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_pm@=
s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436=
/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1=
/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/sh=
ard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
31v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#=
2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43531v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
531v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
31v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@xe_evict=
@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/=
igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict=
@evict-beng-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_ev=
ict@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_evi=
ct@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-=
436/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/ig=
t@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel =
XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-7/igt@xe_evict=
@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4060">Intel XE#4060</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-4/ig=
t@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#24=
72</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict=
@evict-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@xe_e=
vict@evict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6 -&gt; xe-pw-143=
531v1</li>
</ul>
<p>IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6: 61e0f64bde73d48e3dc204c=
129c25e0a15f0d4e6<br />
  xe-pw-143531v1: 143531v1</p>

</body>
</html>

--===============5330920824903350483==--
