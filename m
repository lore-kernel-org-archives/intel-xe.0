Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B391C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 17:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CB610E6AB;
	Wed, 31 Jul 2024 17:54:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DC810E6AA;
 Wed, 31 Jul 2024 17:54:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6836997442349258689=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Write_all_slices_if_i?=
 =?utf-8?q?ts_mcr_register_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 17:54:57 -0000
Message-ID: <172244849758.468917.18415957856392892634@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240731093152.51424-1-tejas.upadhyay@intel.com>
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

--===============6836997442349258689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Write all slices if its mcr register (rev2)
URL   : https://patchwork.freedesktop.org/series/136731/
State : failure

== Summary ==

CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_full -> xe-pw-136731v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136731v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136731v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136731v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][4] ([Intel XE#2136]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_module_load@many-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_module_load@many-reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-136731v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1465])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#623])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#827]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#619])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1204])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1231])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#1231])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2191])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1512])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#1252])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1252])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2351]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#787]) +65 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#787]) +111 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1399]) +12 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#306]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201]) +14 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_color@ctm-0-50.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1188]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1413])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#308])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#308])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [FAIL][59] ([Intel XE#1541])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#776])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#776])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2028])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1137] / [Intel XE#1201])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1137])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1137] / [Intel XE#1201])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1421]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#886]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1195])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1397])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#455]) +26 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1401] / [Intel XE#1745]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#455]) +20 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][78] ([Intel XE#324]) +1 other test dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1401]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#455]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][81] -> [FAIL][82] ([Intel XE#1874])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#1861]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#651]) +10 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#658])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1469]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#2351])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#653]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1151] / [Intel XE#1201])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#656]) +26 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#656]) +25 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#1201] / [i915#2575]) +15 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [PASS][100] -> [DMESG-FAIL][101] ([Intel XE#324])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#599]) +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#498]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2423]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2318]) +18 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#870])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#718])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#1430])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#908])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][119] ([Intel XE#2029])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#2007])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#2389])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_pm_rpm@i2c.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#1201]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#836])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1122] / [Intel XE#1201])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1128])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1122] / [Intel XE#1201])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][133] -> [SKIP][134] ([Intel XE#2351]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1149] / [Intel XE#1201])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#327])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1437]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#327])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         NOTRUN -> [FAIL][139] ([Intel XE#1874]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#362])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][141] ([Intel XE#1729])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#362])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#330])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][144] -> [FAIL][145] ([Intel XE#899]) +1 other test fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [PASS][146] -> [SKIP][147] ([Intel XE#2423]) +11 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_vblank@query-forked.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_vblank@query-forked.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][148] ([Intel XE#2019]) +2 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1499] / [Intel XE#599])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#756])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#1447])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1126] / [Intel XE#1201])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][155] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][156] -> [TIMEOUT][157] ([Intel XE#1473] / [Intel XE#392])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#688]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-lnl:          [PASS][162] -> [SKIP][163] ([Intel XE#1130]) +28 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1130]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1392]) +8 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1201] / [Intel XE#1392]) +7 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][167] -> [SKIP][168] ([Intel XE#1130] / [Intel XE#1201]) +28 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#1130] / [Intel XE#1201]) +10 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_exec_basic@once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#1201] / [Intel XE#2360])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-lnl:          NOTRUN -> [FAIL][173] ([Intel XE#2343])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-bal-rebind:
    - shard-adlp:         [PASS][174] -> [SKIP][175] ([Intel XE#1201]) +21 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html

  * igt@xe_exec_threads@threads-rebind-bindexecqueue:
    - shard-adlp:         [PASS][176] -> [INCOMPLETE][177] ([Intel XE#1169] / [Intel XE#1195])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_exec_threads@threads-rebind-bindexecqueue.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_exec_threads@threads-rebind-bindexecqueue.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-dg2-set2:     [PASS][178] -> [FAIL][179] ([Intel XE#2262])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
    - shard-lnl:          [PASS][180] -> [FAIL][181] ([Intel XE#2262])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_gt_freq@freq_fixed_exec.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][182] -> [DMESG-WARN][183] ([Intel XE#1620])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#255])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#2229])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#1201] / [Intel XE#2229])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#1201] / [Intel XE#2229])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@reload:
    - shard-lnl:          NOTRUN -> [FAIL][189] ([Intel XE#2136])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#1201] / [Intel XE#2419]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#1201] / [Intel XE#2419]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_oa@polling-small-buf.html
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#2419]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#1201] / [Intel XE#977])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#1201] / [Intel XE#977])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#977])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][196] ([Intel XE#1173])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          [PASS][197] -> [FAIL][198] ([Intel XE#1924] / [Intel XE#2028])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2284] / [Intel XE#366])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][203] -> [ABORT][204] ([Intel XE#1358] / [Intel XE#1607])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#1201] / [Intel XE#579])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#579])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#944]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@large-split-binds-33554432:
    - shard-adlp:         [PASS][210] -> [SKIP][211] ([Intel XE#1130] / [Intel XE#1201]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_vm@large-split-binds-33554432.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_vm@large-split-binds-33554432.html

  * igt@xe_vm@large-userptr-split-binds-33554432:
    - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#1130] / [Intel XE#1201])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_vm@large-userptr-split-binds-33554432.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@core_hotunplug@hotreplug.html
    - shard-lnl:          [SKIP][215] ([Intel XE#1885]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@core_hotunplug@hotreplug.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-lnl:          [SKIP][217] -> [PASS][218] +3 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@core_setmaster@master-drop-set-shared-fd.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#2134]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@fbdev@eof.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@fbdev@eof.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][221] ([Intel XE#1701]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][223] ([Intel XE#1426]) -> [PASS][224] +3 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201]) -> [PASS][226] +9 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][227] ([Intel XE#1231]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-adlp:         [INCOMPLETE][229] ([Intel XE#1195]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [i915#2575]) -> [PASS][232] +10 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-adlp:         [DMESG-WARN][233] ([Intel XE#877]) -> [PASS][234] +1 other test pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_cursor_legacy@single-bo.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-lnl:          [SKIP][235] ([Intel XE#2351]) -> [PASS][236] +23 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_draw_crc@draw-method-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][237] ([Intel XE#1195]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][240] +28 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][241] ([Intel XE#2049]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][244] +7 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][245] ([Intel XE#1874]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-adlp:         [SKIP][247] ([Intel XE#1201]) -> [PASS][248] +82 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][249] ([Intel XE#324]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][251] ([Intel XE#361]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][253] ([Intel XE#1430]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [FAIL][255] ([Intel XE#2028]) -> [PASS][256] +2 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][257] ([Intel XE#2423]) -> [PASS][258] +38 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][259] ([Intel XE#899]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][261] ([Intel XE#899]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][263] -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_vrr@flipline.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][265] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [SKIP][267] ([Intel XE#1130]) -> [PASS][268] +79 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-lnl:          [DMESG-WARN][269] -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_exec_reset@close-execqueues-close-fd.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-mixed-rebind:
    - shard-adlp:         [DMESG-WARN][271] ([Intel XE#2226]) -> [PASS][272] +3 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_threads@threads-mixed-rebind.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_exec_threads@threads-mixed-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1192]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          [FAIL][275] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@xe_pm@s2idle-mocs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][277] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][279] ([Intel XE#1794]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [FAIL][281] ([Intel XE#1081]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@bind-one-bo-many-times:
    - shard-adlp:         [DMESG-WARN][283] ([Intel XE#1727] / [Intel XE#2226]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_vm@bind-one-bo-many-times.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_vm@bind-one-bo-many-times.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-adlp:         [SKIP][285] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][286] +28 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_vm@large-split-binds-2147483648.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_vm@large-split-binds-2147483648.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][288] +61 other tests pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          [SKIP][289] ([Intel XE#1125]) -> [SKIP][290] ([Intel XE#2351])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@intel_hwmon@hwmon-read.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@intel_hwmon@hwmon-read.html
    - shard-adlp:         [SKIP][291] ([Intel XE#1125] / [Intel XE#1201]) -> [SKIP][292] ([Intel XE#1201])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@intel_hwmon@hwmon-read.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#873]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#873])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][295] ([Intel XE#664]) -> [SKIP][296] ([Intel XE#2423])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_async_flips@test-cursor.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][298] ([Intel XE#1201] / [i915#2575])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][299] ([Intel XE#1426]) -> [SKIP][300] ([Intel XE#1201])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-lnl:          [SKIP][301] ([Intel XE#599]) -> [SKIP][302] ([Intel XE#2423])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#455]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-lnl:          [FAIL][305] ([Intel XE#1426]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][308] ([Intel XE#1201])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-lnl:          [SKIP][309] ([Intel XE#1407]) -> [SKIP][310] ([Intel XE#2351])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#316])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-lnl:          [SKIP][313] ([Intel XE#2351]) -> [SKIP][314] ([Intel XE#1407])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#316]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][317] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][318] ([Intel XE#1201]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][319] ([Intel XE#1201]) -> [SKIP][320] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][322] ([Intel XE#316])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [SKIP][323] ([Intel XE#2351]) -> [DMESG-WARN][324] ([Intel XE#1725])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][325] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][326] ([Intel XE#1201])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][327] ([Intel XE#2351]) -> [SKIP][328] ([Intel XE#1124]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][329] ([Intel XE#1201]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#316])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][331] ([Intel XE#1231]) -> [DMESG-FAIL][332] ([Intel XE#324])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          [SKIP][333] ([Intel XE#1124]) -> [SKIP][334] ([Intel XE#2351])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-adlp:         [FAIL][335] ([Intel XE#1874]) -> [SKIP][336] ([Intel XE#1201]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][337] ([Intel XE#1201]) -> [FAIL][338] ([Intel XE#1231])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1201]) -> [SKIP][340] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1124]) -> [SKIP][342] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][344] ([Intel XE#1201]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][346] ([Intel XE#619]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201]) -> [SKIP][348] ([Intel XE#1124])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][350] ([Intel XE#1124]) +5 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][352] ([Intel XE#346])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_big_joiner@basic.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#346]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#346])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][356] ([Intel XE#367]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          [SKIP][359] ([Intel XE#2423]) -> [SKIP][360] ([Intel XE#2191])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         [SKIP][361] ([Intel XE#1201]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#2191])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][364] ([Intel XE#2191])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#367]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#367])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         [SKIP][367] ([Intel XE#1201]) -> [SKIP][368] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [i915#2575]) -> [SKIP][370] ([Intel XE#1201] / [Intel XE#367])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          [SKIP][371] ([Intel XE#2423]) -> [SKIP][372] ([Intel XE#367])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][374] ([Intel XE#1201]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
    - shard-adlp:         [SKIP][375] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][376] ([Intel XE#1201]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1201]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1201]) -> [SKIP][382] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][384] ([Intel XE#787]) +41 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#787]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][388] ([Intel XE#1201])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
    - shard-lnl:          [SKIP][389] ([Intel XE#1399]) -> [SKIP][390] ([Intel XE#2351]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][391] ([Intel XE#2351]) -> [SKIP][392] ([Intel XE#1399]) +6 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][394] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][396] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][398] ([Intel XE#314])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         [SKIP][399] ([Intel XE#1201]) -> [SKIP][400] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][402] ([Intel XE#1201] / [Intel XE#306])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][403] ([Intel XE#2423]) -> [SKIP][404] ([Intel XE#306]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1201] / [i915#2575]) -> [SKIP][406] ([Intel XE#306])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][408] ([Intel XE#306])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201] / [i915#2575]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#306])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#373]) -> [SKIP][412] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#373]) -> [SKIP][414] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-read.html
    - shard-lnl:          [SKIP][415] ([Intel XE#373]) -> [SKIP][416] ([Intel XE#2423]) +2 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-read.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][418] ([Intel XE#1201] / [i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - shard-adlp:         [SKIP][419] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][420] ([Intel XE#1201]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][422] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#373])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-fast.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         [SKIP][425] ([Intel XE#1201]) -> [SKIP][426] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1201] / [i915#2575]) -> [SKIP][428] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][430] ([Intel XE#373])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          [SKIP][431] ([Intel XE#2423]) -> [SKIP][432] ([Intel XE#373]) +3 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][434] ([Intel XE#373]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201] / [i915#2575]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][438] ([Intel XE#307])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          [SKIP][439] ([Intel XE#2423]) -> [SKIP][440] ([Intel XE#307])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         [SKIP][441] ([Intel XE#1201]) -> [SKIP][442] ([Intel XE#1201] / [Intel XE#307])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#307]) -> [SKIP][444] ([Intel XE#1201] / [Intel XE#307])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][446] ([Intel XE#307]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][448] ([Intel XE#1201] / [i915#2575])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_content_protection@type1.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-lnl:          [SKIP][451] ([Intel XE#1413]) -> [SKIP][452] ([Intel XE#2423])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][453] ([Intel XE#2423]) -> [SKIP][454] ([Intel XE#1413])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-adlp:         [SKIP][455] ([Intel XE#1201]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#308])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][458] ([Intel XE#308])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201] / [i915#2575]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#455])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-lnl:          [SKIP][461] ([Intel XE#2423]) -> [SKIP][462] ([Intel XE#1424])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][464] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-lnl:          [SKIP][465] ([Intel XE#1424]) -> [SKIP][466] ([Intel XE#2423])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         [SKIP][467] ([Intel XE#1201]) -> [SKIP][468] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-lnl:          [SKIP][469] ([Intel XE#2423]) -> [SKIP][470] ([Intel XE#309])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][471] ([Intel XE#309]) -> [SKIP][472] ([Intel XE#2423])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][474] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          [SKIP][475] ([Intel XE#2423]) -> [SKIP][476] ([Intel XE#323]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-adlp:         [SKIP][477] ([Intel XE#1201]) -> [SKIP][478] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][480] ([Intel XE#323])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][482] ([Intel XE#455]) +6 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          [SKIP][483] ([Intel XE#2351]) -> [SKIP][484] ([Intel XE#599])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_dsc@dsc-with-formats.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#776]) -> [SKIP][486] ([Intel XE#1201] / [Intel XE#776])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][487] ([Intel XE#702]) -> [SKIP][488] ([Intel XE#2423])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_feature_discovery@display-2x.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][489] ([Intel XE#703]) -> [SKIP][490] ([Intel XE#2423])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_feature_discovery@display-3x.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
    - shard-adlp:         [SKIP][491] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][492] ([Intel XE#1201])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_feature_discovery@display-3x.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][495] ([Intel XE#1195] / [Intel XE#2019]) -> [DMESG-WARN][496] ([Intel XE#2019])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         [SKIP][497] ([Intel XE#1201]) -> [SKIP][498] ([Intel XE#1201] / [Intel XE#310])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html
    - shard-lnl:          [SKIP][499] ([Intel XE#2423]) -> [SKIP][500] ([Intel XE#1421])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          [SKIP][501] ([Intel XE#1421]) -> [SKIP][502] ([Intel XE#2423]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-adlp:         [SKIP][503] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][504] ([Intel XE#1201]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][505] ([Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][506] ([Intel XE#1551])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][507] ([Intel XE#1551]) -> [INCOMPLETE][508] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][509] ([Intel XE#2351]) -> [SKIP][510] ([Intel XE#1397] / [Intel XE#1745])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201]) -> [SKIP][512] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
    - shard-lnl:          [SKIP][513] ([Intel XE#2351]) -> [SKIP][514] ([Intel XE#1401] / [Intel XE#1745])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][516] ([Intel XE#1201])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
    - shard-lnl:          [SKIP][517] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][518] ([Intel XE#2351])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
    - shard-adlp:         [SKIP][519] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][520] ([Intel XE#1201]) +3 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          [SKIP][521] ([Intel XE#2423]) -> [SKIP][522] ([Intel XE#352])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][524] ([Intel XE#1201]) +5 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][526] ([Intel XE#651])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#651]) -> [SKIP][528] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][529] ([Intel XE#1201]) -> [SKIP][530] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1201]) -> [SKIP][532] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][534] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][536] ([Intel XE#651]) +13 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][537] ([Intel XE#1201]) -> [FAIL][538] ([Intel XE#1861])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][540] ([Intel XE#658])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][541] ([Intel XE#1201]) -> [SKIP][542] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][543] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][544] ([Intel XE#1201]) +1 other test skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][545] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][546] ([Intel XE#1201]) +5 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][547] ([Intel XE#2351]) -> [SKIP][548] ([Intel XE#656]) +18 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1201]) -> [SKIP][550] ([Intel XE#651])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][551] ([Intel XE#2351]) -> [SKIP][552] ([Intel XE#651]) +3 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          [SKIP][553] ([Intel XE#651]) -> [SKIP][554] ([Intel XE#2351]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#651]) -> [SKIP][556] ([Intel XE#1201])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#653]) -> [SKIP][558] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][560] ([Intel XE#653]) +2 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][561] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][562] ([Intel XE#1201]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][563] ([Intel XE#1201]) -> [SKIP][564] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#1201]) -> [SKIP][566] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#653]) -> [SKIP][568] ([Intel XE#1201])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
    - shard-lnl:          [SKIP][569] ([Intel XE#656]) -> [SKIP][570] ([Intel XE#2351]) +5 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][572] ([Intel XE#1201] / [Intel XE#2351])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][574] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][576] ([Intel XE#1201]) +4 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][578] ([Intel XE#653]) +12 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          [SKIP][579] ([Intel XE#2423]) -> [SKIP][580] ([Intel XE#2340])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_getfb@getfb2-accept-ccs.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-adlp:         [SKIP][581] ([Intel XE#1201]) -> [SKIP][582] ([Intel XE#1201] / [Intel XE#1339])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#455]) -> [SKIP][584] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][585] ([Intel XE#2423]) -> [SKIP][586] ([Intel XE#599])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-adlp:         [SKIP][587] ([Intel XE#1201]) -> [SKIP][588] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_hdr@invalid-metadata-sizes.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][590] ([Intel XE#1162])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#1201] / [i915#2575]) -> [SKIP][592] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-lnl:          [SKIP][593] ([Intel XE#2423]) -> [SKIP][594] ([Intel XE#498])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-adlp:         [SKIP][595] ([Intel XE#1201]) -> [SKIP][596] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#2318]) -> [SKIP][598] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][600] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-lnl:          [SKIP][601] ([Intel XE#2423]) -> [SKIP][602] ([Intel XE#2318])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         [SKIP][603] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][604] ([Intel XE#1201])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][606] ([Intel XE#1201] / [i915#2575])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-lnl:          [SKIP][607] ([Intel XE#2318]) -> [SKIP][608] ([Intel XE#2423])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#1122]) -> [SKIP][610] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][611] ([Intel XE#2351]) -> [SKIP][612] ([Intel XE#1131])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][614] ([Intel XE#1201])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][616] ([Intel XE#1489]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1489]) -> [SKIP][618] ([Intel XE#1201])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#1489]) -> [SKIP][620] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         [SKIP][621] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][622] ([Intel XE#1201])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#1122]) -> [SKIP][624] ([Intel XE#1201])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1201]) -> [SKIP][626] ([Intel XE#1122] / [Intel XE#1201])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          [SKIP][627] ([Intel XE#2351]) -> [SKIP][628] ([Intel XE#1128])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         [SKIP][629] ([Intel XE#1201]) -> [SKIP][630] ([Intel XE#1122] / [Intel XE#1201])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          [SKIP][631] ([Intel XE#2351]) -> [SKIP][632] ([Intel XE#1406]) +2 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][634] ([Intel XE#1201]) +2 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1201]) -> [SKIP][636] ([Intel XE#929]) +3 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#929]) -> [SKIP][638] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1201]) -> [SKIP][640] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-render:
    - shard-adlp:         [SKIP][641] ([Intel XE#1201]) -> [SKIP][642] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_psr@pr-cursor-render.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@pr-suspend:
    - shard-lnl:          [SKIP][643] ([Intel XE#1406]) -> [SKIP][644] ([Intel XE#2351])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr@pr-suspend.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][646] ([Intel XE#929]) +8 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr@psr-dpms.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-adlp:         [SKIP][647] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][648] ([Intel XE#1201]) +2 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-onoff.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][649] ([Intel XE#1201]) -> [SKIP][650] ([Intel XE#1149] / [Intel XE#1201])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [SKIP][651] ([Intel XE#1201]) -> [FAIL][652] ([Intel XE#1874])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#327]) -> [SKIP][654] ([Intel XE#1201] / [Intel XE#327])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][656] ([Intel XE#1201] / [i915#2575])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-lnl:          [SKIP][657] ([Intel XE#1127]) -> [SKIP][658] ([Intel XE#2423])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][660] ([Intel XE#327]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#1500]) -> [SKIP][662] ([Intel XE#1201] / [Intel XE#1500])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1201] / [i915#2575]) -> [SKIP][664] ([Intel XE#455])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][666] ([Intel XE#1201] / [i915#2575])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#756]) -> [SKIP][668] ([Intel XE#1201] / [Intel XE#756])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][669] ([Intel XE#1091]) -> [SKIP][670] ([Intel XE#1091] / [Intel XE#1201])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         [SKIP][671] ([Intel XE#1201]) -> [SKIP][672] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][674] ([Intel XE#1280] / [Intel XE#455]) +3 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         [SKIP][675] ([Intel XE#1201]) -> [SKIP][676] ([Intel XE#1126] / [Intel XE#1201])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][678] ([Intel XE#1126] / [Intel XE#1201])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
    - shard-adlp:         [SKIP][679] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][680] ([Intel XE#1126] / [Intel XE#1201])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          [SKIP][681] ([Intel XE#688]) -> [SKIP][682] ([Intel XE#1130])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-small.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][683] ([Intel XE#1600]) -> [SKIP][684] ([Intel XE#1130] / [Intel XE#1201])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-adlp:         [SKIP][685] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][686] ([Intel XE#1130] / [Intel XE#1201])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][687] ([Intel XE#1473] / [Intel XE#402]) -> [INCOMPLETE][688] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         [SKIP][689] ([Intel XE#1201]) -> [SKIP][690] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-dg2-set2:     [SKIP][691] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][692] ([Intel XE#1600])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [FAIL][693] ([Intel XE#1000]) -> [INCOMPLETE][694] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         [SKIP][695] ([Intel XE#1201] / [Intel XE#688]) -> [SKIP][696] ([Intel XE#1201])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          [SKIP][697] ([Intel XE#1130]) -> [SKIP][698] ([Intel XE#688]) +4 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - shard-adlp:         [SKIP][699] ([Intel XE#1201]) -> [SKIP][700] ([Intel XE#1201] / [Intel XE#688])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-lnl:          [SKIP][701] ([Intel XE#1392]) -> [SKIP][702] ([Intel XE#1130])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         [SKIP][703] ([Intel XE#1201]) -> [SKIP][704] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          [SKIP][705] ([Intel XE#1130]) -> [SKIP][706] ([Intel XE#1392]) +3 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-basic-imm:
    - shard-adlp:         [SKIP][707] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][708] ([Intel XE#1201]) +1 other test skip
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_exec_fault_mode@many-basic-imm.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_fault_mode@many-basic-imm.html

  * igt@xe_exec_fault_mode@once-basic:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][710] ([Intel XE#1130] / [Intel XE#1201]) +5 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_exec_fault_mode@once-basic.html
    - shard-adlp:         [SKIP][711] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][712] ([Intel XE#1130] / [Intel XE#1201])
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_fault_mode@once-basic.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#288]) -> [SKIP][714] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][715] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][716] ([Intel XE#288]) +4 other tests skip
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][717] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][718] ([Intel XE#288]) +12 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-adlp:         [SKIP][719] ([Intel XE#1201]) -> [SKIP][720] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-adlp:         [SKIP][721] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][722] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][724] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][725] ([Intel XE#288]) -> [SKIP][726] ([Intel XE#1130] / [Intel XE#1201])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][727] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][728] ([Intel XE#2360])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][730] ([Intel XE#1130] / [Intel XE#1201])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
    - shard-adlp:         [SKIP][731] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][732] ([Intel XE#1201])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [FAIL][733] ([Intel XE#2256]) -> [FAIL][734] ([Intel XE#2262])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][735] ([Intel XE#1999]) -> [SKIP][736] ([Intel XE#1192] / [Intel XE#1201])
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][737] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][738] ([Intel XE#2419]) +4 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#2419]) -> [SKIP][740] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][741] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][742] ([Intel XE#1173])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_peer2peer@read.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][743] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][744] ([Intel XE#2284] / [Intel XE#366])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][746] ([Intel XE#1551] / [Intel XE#569])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
    - shard-lnl:          [SKIP][747] ([Intel XE#1130]) -> [SKIP][748] ([Intel XE#584]) +1 other test skip
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_pm@s3-basic-exec.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [SKIP][749] ([Intel XE#1130] / [Intel XE#1201]) -> [ABORT][750] ([Intel XE#1358])
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][751] ([Intel XE#1794]) -> [SKIP][752] ([Intel XE#1130] / [Intel XE#1201])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#944]) -> [SKIP][754] ([Intel XE#1201] / [Intel XE#944])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][756] ([Intel XE#944])
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][758] ([Intel XE#1201] / [Intel XE#944])
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-lnl:          [SKIP][759] ([Intel XE#1130]) -> [SKIP][760] ([Intel XE#944])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-adlp:         [SKIP][761] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][762] ([Intel XE#1201] / [Intel XE#944])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
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
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2389
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7944 -> IGT_7946
  * Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -> xe-pw-136731v2

  IGT_7944: 7944
  IGT_7946: 7946
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338
  xe-pw-136731v2: 136731v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/index.html

--===============6836997442349258689==
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
<tr><td><b>Series:</b></td><td>drm/xe: Write all slices if its mcr register (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136731/">https://patchwork.freedesktop.org/series/136731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_full -&gt; xe-pw-136731v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136731v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136731v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136731v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_module_load@reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@many-reload:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136731v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +20 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2389">Intel XE#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_vblank@query-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_vblank@query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_exec_basic@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_exec_threads@threads-rebind-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_exec_threads@threads-rebind-bindexecqueue.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-33554432:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_vm@large-split-binds-33554432.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_vm@large-split-binds-33554432.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-33554432:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_vm@large-userptr-split-binds-33554432.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@core_hotunplug@hotreplug.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_cursor_legacy@single-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_draw_crc@draw-method-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_draw_crc@draw-method-blt.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +82 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_vrr@flipline.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_threads@threads-mixed-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_exec_threads@threads-mixed-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@xe_pm@s2idle-mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@xe_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_vm@bind-one-bo-many-times.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_vm@bind-one-bo-many-times.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_vm@large-split-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_vm@large-split-binds-2147483648.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +61 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_exec_fault_mode@many-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_fault_mode@many-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256">Intel XE#2256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-4/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7944 -&gt; IGT_7946</li>
<li>Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -&gt; xe-pw-136731v2</li>
</ul>
<p>IGT_7944: 7944<br />
  IGT_7946: 7946<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338<br />
  xe-pw-136731v2: 136731v2</p>

</body>
</html>

--===============6836997442349258689==--
