Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF55FC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 21:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7F1129D1;
	Wed,  8 May 2024 21:20:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CD51129D1;
 Wed,  8 May 2024 21:20:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1506879500841927934=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_Cursor_Fault_Fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 21:20:28 -0000
Message-ID: <171520322820.2023278.10238010624889285279@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508073904.1661848-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240508073904.1661848-1-chaitanya.kumar.borah@intel.com>
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

--===============1506879500841927934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cursor Fault Fix (rev2)
URL   : https://patchwork.freedesktop.org/series/133310/
State : success

== Summary ==

CI Bug Log - changes from xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803_full -> xe-pw-133310v2_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133310v2_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-edp-1:
    - {shard-lnl}:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-edp-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-5/igt@kms_flip@flip-vs-suspend.html

  
New tests
---------

  New tests have been introduced between xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803_full and xe-pw-133310v2_full:

### New IGT tests (1) ###

  * igt@kms_display_modes:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-133310v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][6] ([Intel XE#1214] / [Intel XE#1667])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@core_hotunplug@hotrebind.html

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1125] / [Intel XE#1201])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#1201] / [i915#6077])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-464/igt@kms_addfb_basic@addfb25-4-tiled.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1195]) +3 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@kms_atomic_interruptible@legacy-cursor.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#1388]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#619])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][18] ([Intel XE#324])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1231]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1231])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1204])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#650]) +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +26 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_color@ctm-0-50:
    - shard-adlp:         [PASS][35] -> [SKIP][36] ([Intel XE#1201]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_color@ctm-0-50.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_color@ctm-0-50.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#307])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#308])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][40] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1195] / [Intel XE#927])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1138] / [Intel XE#1201])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][46] ([Intel XE#1195])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][47] ([Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [FAIL][48] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#616]) +10 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#616]) +3 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#656]) +35 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#1341])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#616])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#356])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][60] ([Intel XE#1195] / [Intel XE#927])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#870])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][66] -> [SKIP][67] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#836])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1122] / [Intel XE#1201])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#929]) +15 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_psr@psr-suspend.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#1201]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@kms_rmfb@rmfb-ioctl.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#1201] / [Intel XE#829])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1127] / [Intel XE#1201])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#327])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#327])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][80] ([Intel XE#1174])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][81] ([Intel XE#1191] / [Intel XE#1214]) +2 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#455]) +24 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#756])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1123] / [Intel XE#1201])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1126] / [Intel XE#1201])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][90] -> [DMESG-FAIL][91] ([Intel XE#482])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][92] -> [TIMEOUT][93] ([Intel XE#1473])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][94] -> [TIMEOUT][95] ([Intel XE#1473] / [Intel XE#392])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#1392]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#1562]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - shard-adlp:         [PASS][103] -> [DMESG-FAIL][104] ([Intel XE#1069] / [Intel XE#1330])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][105] ([Intel XE#1195]) +1 other test incomplete
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#1192] / [Intel XE#1201])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][108] -> [DMESG-WARN][109] ([Intel XE#1162] / [Intel XE#1214]) +6 other tests dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@xe_module_load@reload.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@xe_module_load@reload.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#979])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][111] ([Intel XE#1221])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#366])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#366])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][114] -> [DMESG-WARN][115] ([Intel XE#1214])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][116] -> [ABORT][117] ([Intel XE#1358])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - {shard-lnl}:        [FAIL][121] -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][123] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][125] ([Intel XE#1231]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [FAIL][127] ([Intel XE#616]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2-set2:     [FAIL][129] ([Intel XE#581]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][134] +46 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-lnl}:        [DMESG-WARN][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][137] ([Intel XE#1195]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][141] ([Intel XE#1214]) -> [PASS][142] +4 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#1600]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][145] ([Intel XE#1473]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [SKIP][147] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][151] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][152] +8 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * {igt@xe_pm@s3-mocs}:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#1214]) -> [PASS][154] +2 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_pm@s3-mocs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [INCOMPLETE][155] ([Intel XE#1195] / [Intel XE#1451]) -> [ABORT][156] ([Intel XE#1538] / [Intel XE#1717])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-9/igt@core_hotunplug@hotreplug.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][157] ([Intel XE#324]) -> [FAIL][158] ([Intel XE#1204])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][159] ([Intel XE#1231]) -> [DMESG-FAIL][160] ([Intel XE#324])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#829])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
    - shard-adlp:         [SKIP][163] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#829])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#829])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
    - shard-adlp:         [SKIP][167] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#829])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         [SKIP][169] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][170] ([Intel XE#1201])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][172] ([Intel XE#1201])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [INCOMPLETE][173] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][174] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][175] ([Intel XE#1195]) -> [DMESG-WARN][176] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-adlp:         [SKIP][177] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][178] ([Intel XE#1201])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][179] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][180] ([Intel XE#1201])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][181] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][182] ([Intel XE#1201])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#1235])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][186] ([Intel XE#1201])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#651])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
    - shard-adlp:         [SKIP][189] ([Intel XE#1201]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#656])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][192] ([Intel XE#1201])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
    - shard-adlp:         [SKIP][193] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][194] ([Intel XE#1201])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][195] ([Intel XE#1162]) -> [FAIL][196] ([Intel XE#616]) +1 other test fail
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         [FAIL][197] ([Intel XE#361]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#455])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [FAIL][199] ([Intel XE#361]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#455])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][201] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][202] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][203] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][204] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][205] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][206] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][207] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][208] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [INCOMPLETE][209] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][210] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         [SKIP][211] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#836]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-adlp:         [SKIP][213] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][214] ([Intel XE#1201])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_psr@pr-cursor-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_psr@pr-cursor-blt.html
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][216] ([Intel XE#1201])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@kms_psr@pr-cursor-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][217] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#829])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][219] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][220] ([Intel XE#1034] / [Intel XE#1195])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][222] ([Intel XE#1034] / [Intel XE#1195])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][223] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][224] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][225] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][226] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [INCOMPLETE][227] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][228] ([Intel XE#1191] / [Intel XE#1214])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@xe_pm@s2idle-basic.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][229] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][230] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [DMESG-WARN][231] ([Intel XE#1214]) -> [INCOMPLETE][232] ([Intel XE#1195] / [Intel XE#1358])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7838 -> IGT_7840
  * Linux: xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803 -> xe-pw-133310v2

  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7840: 5d7b61b7ceefedfde2683ff72cd98179c99ab746 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803: a86eda4223247cae54c66577e8f0a6816e02e803
  xe-pw-133310v2: 133310v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/index.html

--===============1506879500841927934==
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
<tr><td><b>Series:</b></td><td>Cursor Fault Fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133310/">https://patchwork.freedesktop.org/series/133310/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803_full -&gt; xe-pw-133310v2_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133310v2_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-5/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803_full and xe-pw-133310v2_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_display_modes:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133310v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667">Intel XE#1667</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-464/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_atomic_interruptible@legacy-cursor.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388">Intel XE#1388</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_color@ctm-0-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@kms_rmfb@rmfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +46 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s3-mocs}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@xe_pm@s3-mocs.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-9/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-435/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-dg2-434/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-1/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-6/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7838 -&gt; IGT_7840</li>
<li>Linux: xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803 -&gt; xe-pw-133310v2</li>
</ul>
<p>IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7840: 5d7b61b7ceefedfde2683ff72cd98179c99ab746 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803: a86eda4223247cae54c66577e8f0a6816e02e803<br />
  xe-pw-133310v2: 133310v2</p>

</body>
</html>

--===============1506879500841927934==--
