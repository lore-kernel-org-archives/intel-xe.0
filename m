Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A077FC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 18:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1230810EBC1;
	Wed, 15 May 2024 18:15:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3432B10E56A;
 Wed, 15 May 2024 18:15:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5444980257306136225=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Update_on_habanalabs=2C_Xe_main?=
 =?utf-8?q?tainer_status?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oded Gabbay" <ogabbay@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 18:15:23 -0000
Message-ID: <171579692319.2118792.15671837938929634692@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515162222.12958-1-ogabbay@kernel.org>
In-Reply-To: <20240515162222.12958-1-ogabbay@kernel.org>
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

--===============5444980257306136225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update on habanalabs, Xe maintainer status
URL   : https://patchwork.freedesktop.org/series/133661/
State : failure

== Summary ==

CI Bug Log - changes from xe-1292-d98c9eae84056cb2d86293c145234017681f09f4_full -> xe-pw-133661v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133661v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133661v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133661v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][1] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-adlp:         [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_properties@plane-properties-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_properties@plane-properties-atomic.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][4] ([Intel XE#1178]) -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@basic:
    - {shard-lnl}:        NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_addfb_basic@basic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - {shard-lnl}:        [SKIP][7] ([Intel XE#656]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_getfb@getfb-handle-valid:
    - {shard-lnl}:        [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-3/igt@kms_getfb@getfb-handle-valid.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_getfb@getfb-handle-valid.html

  * igt@kms_plane@pixel-format-source-clamping:
    - {shard-lnl}:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-5/igt@kms_plane@pixel-format-source-clamping.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_plane@pixel-format-source-clamping.html

  
Known issues
------------

  Here are the changes found in xe-pw-133661v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [ABORT][13] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@core_hotunplug@hotreplug.html

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1125] / [Intel XE#1201])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1201] / [i915#6077])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_addfb_basic@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_addfb_basic@basic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][17] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][18] ([Intel XE#1033] / [Intel XE#1214])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][19] ([Intel XE#1214] / [Intel XE#324]) +2 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#610])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
    - shard-adlp:         [PASS][24] -> [SKIP][25] ([Intel XE#1201] / [Intel XE#829])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][26] ([Intel XE#1204])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1204])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#1231])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][32] ([Intel XE#1231]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#829])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1195]) +2 other tests incomplete
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#787]) +74 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +46 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@ctm-signed:
    - shard-adlp:         [PASS][52] -> [SKIP][53] ([Intel XE#1201]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_color@ctm-signed.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#307])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#308])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-adlp:         NOTRUN -> [FAIL][57] ([Intel XE#581])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#581])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][60] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#323])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][65] -> [DMESG-WARN][66] ([Intel XE#282]) +2 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#701])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#703])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1137] / [Intel XE#1201])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1137] / [Intel XE#1201])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1135] / [Intel XE#1201])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#310]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1162]) +3 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][75] -> [DMESG-FAIL][76] ([Intel XE#1330] / [Intel XE#1638] / [Intel XE#1760]) +2 other tests dmesg-fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#455]) +29 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][78] ([Intel XE#324]) +3 other tests dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#1150] / [Intel XE#1195])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_flip_tiling@flip-change-tiling.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][83] ([Intel XE#1861]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#653])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#656]) +45 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_getfb@getfb-handle-valid:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#1201] / [Intel XE#687])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_getfb@getfb-handle-valid.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_getfb@getfb-handle-valid.html
    - shard-adlp:         [PASS][90] -> [SKIP][91] ([Intel XE#1201] / [Intel XE#687])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_getfb@getfb-handle-valid.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_getfb@getfb-handle-valid.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#1339])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#417])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#616]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][95] ([Intel XE#1214] / [Intel XE#1638])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][96] -> [DMESG-WARN][97] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         [PASS][98] -> [DMESG-WARN][99] ([Intel XE#1214] / [Intel XE#1608])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#361])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][104] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][105] ([Intel XE#904] / [Intel XE#909])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#1201]) +11 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#305]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#455])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][115] ([Intel XE#718])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#1211])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [PASS][117] -> [SKIP][118] ([Intel XE#1201] / [Intel XE#1211])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_prop_blob@invalid-set-prop-any:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1201] / [Intel XE#780])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_prop_blob@invalid-set-prop-any.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_prop_blob@invalid-set-prop-any.html
    - shard-adlp:         [PASS][121] -> [SKIP][122] ([Intel XE#1201] / [Intel XE#780])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_prop_blob@invalid-set-prop-any.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_prop_blob@invalid-set-prop-any.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201]) +17 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#929]) +18 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1201])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1149] / [Intel XE#1201])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#327])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1127] / [Intel XE#1201]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][131] ([Intel XE#1174])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][132] -> [FAIL][133] ([Intel XE#771] / [Intel XE#899])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][134] -> [FAIL][135] ([Intel XE#899])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#756]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#756])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-adlp:         NOTRUN -> [FAIL][138] ([Intel XE#1080]) +9 other tests fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][141] -> [FAIL][142] ([Intel XE#1041])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#261]) +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-dg2-set2:     [PASS][146] -> [FAIL][147] ([Intel XE#1257])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@xe_exec_basic@many-basic-defer-bind.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#1392]) +12 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         NOTRUN -> [FAIL][149] ([Intel XE#1396])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#288]) +26 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#288]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [PASS][153] -> [INCOMPLETE][154] ([Intel XE#1195])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1201] / [Intel XE#512])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_mmap@small-bar.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1201] / [Intel XE#366])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][157] ([Intel XE#1191] / [Intel XE#1214]) +2 other tests dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
    - shard-adlp:         [PASS][160] -> [DMESG-WARN][161] ([Intel XE#1214]) +3 other tests dmesg-warn
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@xe_pm@s3-vm-bind-unbind-all.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][162] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][163] -> [ABORT][164] ([Intel XE#1794])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][166] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201]) -> [PASS][168] +15 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][169] ([Intel XE#1659]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#282]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][176] +2 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [i915#2575]) -> [PASS][178] +10 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-adlp:         [ABORT][179] -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-b.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [SKIP][183] ([Intel XE#1201]) -> [PASS][184] +11 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - {shard-lnl}:        [SKIP][185] ([Intel XE#1650]) -> [PASS][186] +11 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-adlp:         [SKIP][187] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_plane@plane-position-hole-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_plane@plane-position-hole-dpms.html
    - {shard-lnl}:        [SKIP][191] ([Intel XE#829]) -> [PASS][192] +2 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-adlp:         [FAIL][193] -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [FAIL][195] ([Intel XE#1203]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-adlp:         [SKIP][197] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_pm_rpm@dpms-lpsp.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     [FAIL][199] ([Intel XE#1050]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - {shard-lnl}:        [INCOMPLETE][201] ([Intel XE#1330]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-4/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-3/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][203] ([Intel XE#1473]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][205] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate:
    - {shard-lnl}:        [INCOMPLETE][207] -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-adlp:         [DMESG-FAIL][209] ([Intel XE#1069] / [Intel XE#1330]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][212] +18 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - {shard-lnl}:        [SKIP][213] ([Intel XE#1462]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-3/igt@xe_gt_freq@freq_fixed_idle.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-6/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_intel_bb@simple-bb-ctx:
    - shard-adlp:         [INCOMPLETE][215] ([Intel XE#1195] / [Intel XE#1760]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_intel_bb@simple-bb-ctx.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_intel_bb@simple-bb-ctx.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1192]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs:
    - {shard-lnl}:        [SKIP][221] ([Intel XE#1192]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][223] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [WARN][225] ([Intel XE#1639]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [INCOMPLETE][227] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - {shard-lnl}:        [ABORT][229] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][231] ([Intel XE#1214]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [INCOMPLETE][233] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1717]) -> [ABORT][234] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [INCOMPLETE][235] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451]) -> [ABORT][236] ([Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][237] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][238] ([Intel XE#1124] / [Intel XE#1201])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][240] ([Intel XE#316]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#316])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-adlp:         [SKIP][243] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#316])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#316]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#316])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201]) -> [SKIP][248] ([Intel XE#316]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][249] ([Intel XE#324]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#829])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][252] ([Intel XE#1124] / [Intel XE#1201])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][254] ([Intel XE#1124]) +6 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201]) -> [SKIP][256] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1124]) -> [SKIP][258] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][260] ([Intel XE#346])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#367]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#367])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][264] ([Intel XE#367]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][266] ([Intel XE#787]) +55 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#829])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#787]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][275] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1252]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#1252])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][282] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-adlp:         [SKIP][283] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#306]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#306])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][288] ([Intel XE#1201])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-adlp:         [SKIP][289] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][290] ([Intel XE#1201])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][292] ([Intel XE#306]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_chamelium_color@degamma.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#373]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][296] ([Intel XE#1201]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
    - shard-adlp:         [SKIP][297] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][298] ([Intel XE#1201])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][300] ([Intel XE#373]) +5 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201] / [i915#2575]) -> [SKIP][302] ([Intel XE#455])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_content_protection@mei-interface.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         [SKIP][303] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][304] ([Intel XE#1201]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][306] ([Intel XE#1201])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#308])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][310] ([Intel XE#308]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201] / [i915#2575]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#455])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][313] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][314] ([Intel XE#1195] / [Intel XE#927])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][315] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][316] ([Intel XE#1195])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2-set2:     [DMESG-WARN][317] ([Intel XE#282]) -> [DMESG-WARN][318] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#323]) -> [SKIP][320] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][321] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][322] ([Intel XE#1201])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][323] ([Intel XE#1201]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201]) -> [DMESG-WARN][326] ([Intel XE#1214] / [Intel XE#282])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][327] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][328] ([Intel XE#282]) +6 other tests dmesg-warn
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][329] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][330] ([Intel XE#282])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_cursor_legacy@single-move.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-move.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][332] ([Intel XE#307])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][334] ([Intel XE#776])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1201] / [i915#2575]) -> [SKIP][336] ([Intel XE#1135] / [Intel XE#1201])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][337] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [SKIP][338] ([Intel XE#1201])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         [ABORT][339] -> [SKIP][340] ([Intel XE#1201] / [Intel XE#455])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][342] ([Intel XE#455]) +8 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][343] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][344] ([Intel XE#1201]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][346] ([Intel XE#651]) +16 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][347] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][348] ([Intel XE#1201]) +4 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][350] ([Intel XE#1201]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][353] ([Intel XE#1201]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#651])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#651]) -> [SKIP][356] ([Intel XE#1201]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-adlp:         [SKIP][357] ([Intel XE#1201]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201]) -> [SKIP][360] ([Intel XE#651])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#651]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][363] ([Intel XE#1201]) -> [SKIP][364] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][365] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][366] ([Intel XE#1201])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201]) -> [SKIP][368] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][370] ([Intel XE#658])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][372] ([Intel XE#653]) +17 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][374] ([Intel XE#1201]) +5 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#653]) -> [SKIP][376] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#653])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#605]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#605])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#455]) -> [SKIP][382] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [i915#2575]) -> [FAIL][384] ([Intel XE#616])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [FAIL][385] ([Intel XE#1331]) -> [ABORT][386] ([Intel XE#1035])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][387] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][388] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         [SKIP][389] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][390] ([Intel XE#1201] / [Intel XE#829])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_plane_multiple@tiling-4.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][392] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][394] ([Intel XE#498]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][395] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][396] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][397] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][398] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][399] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][400] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) +1 other test incomplete
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][402] ([Intel XE#1201])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
    - shard-adlp:         [SKIP][403] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][404] ([Intel XE#1201])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1201] / [i915#2575]) -> [SKIP][406] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         [SKIP][407] ([Intel XE#1201]) -> [SKIP][408] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][412] ([Intel XE#870]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][413] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][414] ([Intel XE#1204])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         [SKIP][415] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#1211])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1201]) -> [SKIP][418] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1201]) -> [SKIP][420] ([Intel XE#929])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_psr@fbc-pr-primary-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#929]) -> [SKIP][422] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         [SKIP][423] ([Intel XE#1201]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_psr@pr-sprite-plane-onoff.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][426] ([Intel XE#929]) +11 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#929]) -> [SKIP][428] ([Intel XE#1201])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_psr@psr2-basic.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_psr@psr2-basic.html
    - shard-adlp:         [SKIP][429] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][430] ([Intel XE#1201]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_psr@psr2-basic.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][432] ([Intel XE#1149])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1127]) -> [SKIP][434] ([Intel XE#1127] / [Intel XE#1201])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][436] ([Intel XE#1127] / [Intel XE#1201])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-adlp:         [SKIP][437] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][438] ([Intel XE#1127] / [Intel XE#1201])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][439] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][440] ([Intel XE#1201] / [Intel XE#829])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][442] ([Intel XE#1201] / [Intel XE#829])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][444] ([Intel XE#327]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sequence@queue-idle:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1201] / [i915#2575]) -> [SKIP][446] ([Intel XE#1201])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_sequence@queue-idle.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_sequence@queue-idle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][447] ([Intel XE#1729]) -> [SKIP][448] ([Intel XE#1201] / [Intel XE#362])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         [SKIP][449] ([Intel XE#1201]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#362])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#330]) -> [SKIP][452] ([Intel XE#1201] / [Intel XE#330])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][453] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][454] ([Intel XE#1162]) +1 other test dmesg-warn
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
    - shard-adlp:         [DMESG-WARN][455] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][456] ([Intel XE#1034] / [Intel XE#1195])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][457] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][458] ([Intel XE#1034] / [Intel XE#1195])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201] / [i915#2575]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#756])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_writeback@writeback-check-output.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][462] ([Intel XE#756])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][464] ([Intel XE#1091])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][466] ([Intel XE#1123])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][467] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][468] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#288]) -> [SKIP][470] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][472] ([Intel XE#288]) +13 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][474] ([Intel XE#1201] / [Intel XE#288])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-imm.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#512])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_mmap@small-bar.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][478] ([Intel XE#366]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@xe_pm@d3cold-basic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         [FAIL][479] ([Intel XE#1257]) -> [SKIP][480] ([Intel XE#1201] / [Intel XE#366])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@xe_pm@d3cold-basic-exec.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [INCOMPLETE][481] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][482] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][483] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][484] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][485] ([Intel XE#1162]) -> [DMESG-WARN][486] ([Intel XE#1162] / [Intel XE#1214])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         [INCOMPLETE][487] ([Intel XE#1195]) -> [DMESG-WARN][488] ([Intel XE#1214])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@xe_pm@s3-mocs.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][490] ([Intel XE#1162])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][491] ([Intel XE#1214]) -> [INCOMPLETE][492] ([Intel XE#1195])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#944])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#944]) -> [SKIP][496] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][498] ([Intel XE#944])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-FAIL][499] ([Intel XE#1760]) -> [DMESG-WARN][500] ([Intel XE#1214] / [Intel XE#1760])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
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
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7854 -> IGT_7855
  * Linux: xe-1292-d98c9eae84056cb2d86293c145234017681f09f4 -> xe-pw-133661v1

  IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7855: 7855
  xe-1292-d98c9eae84056cb2d86293c145234017681f09f4: d98c9eae84056cb2d86293c145234017681f09f4
  xe-pw-133661v1: 133661v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/index.html

--===============5444980257306136225==
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
<tr><td><b>Series:</b></td><td>Update on habanalabs, Xe maintainer status</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133661/">https://patchwork.freedesktop.org/series/133661/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1292-d98c9eae84056cb2d86293c145234017681f09f4_full -&gt; xe-pw-133661v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133661v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133661v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133661v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_properties@plane-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_properties@plane-properties-atomic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@atomic@pipe-a-dp-4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-4.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_addfb_basic@basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-valid:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-3/igt@kms_getfb@getfb-handle-valid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_getfb@getfb-handle-valid.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-5/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_plane@pixel-format-source-clamping.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133661v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_addfb_basic@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_addfb_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-valid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_getfb@getfb-handle-valid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_getfb@getfb-handle-valid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_getfb@getfb-handle-valid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_getfb@getfb-handle-valid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_lease@setcrtc-implicit-plane.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop-any:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_prop_blob@invalid-set-prop-any.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_prop_blob@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_prop_blob@invalid-set-prop-any.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_prop_blob@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@sriov_basic@bind-unbind-vf@vf-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@xe_exec_basic@many-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_exec_basic@many-basic-defer-bind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650">Intel XE#1650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> +2 other tests pass</li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-4/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-3/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_exec_compute_mode@once-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-3/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-6/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb-ctx:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_intel_bb@simple-bb-ctx.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639">Intel XE#1639</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-435/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-4/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-8/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_sequence@queue-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@kms_sequence@queue-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-warn</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-464/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@xe_pm@d3cold-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-1/igt@xe_pm@s3-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-6/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1292-d98c9eae84056cb2d86293c145234017681f09f4/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133661v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7854 -&gt; IGT_7855</li>
<li>Linux: xe-1292-d98c9eae84056cb2d86293c145234017681f09f4 -&gt; xe-pw-133661v1</li>
</ul>
<p>IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7855: 7855<br />
  xe-1292-d98c9eae84056cb2d86293c145234017681f09f4: d98c9eae84056cb2d86293c145234017681f09f4<br />
  xe-pw-133661v1: 133661v1</p>

</body>
</html>

--===============5444980257306136225==--
