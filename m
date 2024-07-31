Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8651C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8195F10E63F;
	Wed, 31 Jul 2024 14:30:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662DF10E63E;
 Wed, 31 Jul 2024 14:30:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3946599230987022065=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm=3A_Use_backlight_power_cons?=
 =?utf-8?q?tants?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 14:30:23 -0000
Message-ID: <172243622338.468110.3259892444779325791@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731122311.1143153-1-tzimmermann@suse.de>
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
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

--===============3946599230987022065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Use backlight power constants
URL   : https://patchwork.freedesktop.org/series/136738/
State : failure

== Summary ==

CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_full -> xe-pw-136738v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136738v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136738v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136738v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@core_getversion@all-cards.html
    - shard-adlp:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@core_getversion@all-cards.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@core_getversion@all-cards.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-lnl:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [PASS][9] -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] +5 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][17] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#651]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][22] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][25] +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-adlp:         [SKIP][26] ([Intel XE#1201] / [Intel XE#656]) -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][28] ([Intel XE#1122]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][30] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-blt.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [SKIP][32] ([Intel XE#2423]) -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [FAIL][34] ([Intel XE#1999]) -> [FAIL][35] +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-136738v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1465])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#623])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#324])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#316])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#619])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1407]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][46] -> [DMESG-FAIL][47] ([Intel XE#324])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#1231]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][50] ([Intel XE#1231])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#607])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1124]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2191])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#367])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#367])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1512])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#787]) +83 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1252])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1252])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#787]) +44 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#787]) +27 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1399]) +10 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#373]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#373]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#306]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2423]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#1188]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +28 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#308])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1413])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#308])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1424]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#308])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#309]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#2423]) +40 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1137] / [Intel XE#1201])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1137])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1137] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][94] -> [INCOMPLETE][95] ([Intel XE#1195])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1421]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [i915#2575]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#886]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#455]) +25 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#455]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#1201]) +23 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1401]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#651])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2351])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201]) +60 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2351]) +30 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201]) +12 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][114] -> [FAIL][115] ([Intel XE#1861]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [PASS][116] -> [SKIP][117] ([Intel XE#2351]) +32 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#656]) +21 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#2351])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#651]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#658])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1469]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#653]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#2028]) +3 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#656]) +23 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#1201] / [i915#2575]) +9 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][135] ([Intel XE#616]) +2 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][136] ([Intel XE#2019])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][137] ([Intel XE#324]) +2 other tests dmesg-fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][138] ([Intel XE#324]) +1 other test dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-adlp:         [PASS][139] -> [SKIP][140] ([Intel XE#1201]) +99 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#599]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#498]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2-set2:     [PASS][148] -> [SKIP][149] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-adlp:         [PASS][150] -> [SKIP][151] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#2318]) +11 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1201] / [Intel XE#870])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [PASS][156] -> [SKIP][157] ([Intel XE#870])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#870])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][159] -> [FAIL][160] ([Intel XE#1430])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1201] / [Intel XE#908])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][162] ([Intel XE#2029])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1201] / [Intel XE#2007])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#929]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1149] / [Intel XE#1201])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#1201] / [Intel XE#327])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1437]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#1201] / [Intel XE#327])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         NOTRUN -> [FAIL][172] ([Intel XE#1874]) +4 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1201] / [Intel XE#362])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#362])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#1201] / [Intel XE#330])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     NOTRUN -> [FAIL][176] ([Intel XE#771] / [Intel XE#899])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][177] -> [FAIL][178] ([Intel XE#899])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][179] ([Intel XE#899])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1499] / [Intel XE#599])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#756])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#1201] / [Intel XE#756])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][183] -> [SKIP][184] ([Intel XE#1201] / [Intel XE#2423])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@testdisplay.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#1130] / [Intel XE#1201]) +10 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][188] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#688]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_balancer@many-cm-parallel-rebind:
    - shard-adlp:         [PASS][193] -> [FAIL][194] ([Intel XE#1069])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-rebind.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][195] -> [SKIP][196] ([Intel XE#1130] / [Intel XE#1201]) +71 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_balancer@twice-cm-parallel-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#1130]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_balancer@twice-cm-parallel-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          [PASS][198] -> [SKIP][199] ([Intel XE#1130]) +98 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@many-execqueues-null-rebind:
    - shard-adlp:         [PASS][200] -> [INCOMPLETE][201] ([Intel XE#1195])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_basic@many-execqueues-null-rebind.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#1392]) +8 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#1201] / [Intel XE#1392]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_compute_mode@once-basic:
    - shard-dg2-set2:     [PASS][204] -> [FAIL][205] ([Intel XE#1069])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_compute_mode@once-basic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_exec_compute_mode@once-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][206] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#288]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#1201] / [Intel XE#2360])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-lnl:          NOTRUN -> [FAIL][210] ([Intel XE#2343])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-bal-userptr:
    - shard-dg2-set2:     [PASS][211] -> [SKIP][212] ([Intel XE#1130]) +11 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_threads@threads-bal-userptr.html

  * igt@xe_exec_threads@threads-hang-basic:
    - shard-adlp:         [PASS][213] -> [DMESG-WARN][214] ([Intel XE#2226] / [Intel XE#358]) +1 other test dmesg-warn
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_threads@threads-hang-basic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#1130]) +18 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_exec_threads@threads-userptr-rebind-err.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-dg2-set2:     [PASS][216] -> [FAIL][217] ([Intel XE#2203])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_gt_freq@freq_range_exec.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#1201] / [Intel XE#255])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@purge-bb:
    - shard-adlp:         [PASS][219] -> [DMESG-WARN][220] ([Intel XE#2226]) +11 other tests dmesg-warn
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_intel_bb@purge-bb.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_intel_bb@purge-bb.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#2229])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#1201] / [Intel XE#2229])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [PASS][224] -> [FAIL][225] ([Intel XE#2420]) +1 other test fail
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_live_ktest@xe_dma_buf.html
    - shard-lnl:          [PASS][226] -> [FAIL][227] ([Intel XE#2420]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][228] ([Intel XE#2136])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_module_load@reload.html
    - shard-lnl:          NOTRUN -> [FAIL][229] ([Intel XE#2136])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_module_load@reload.html
    - shard-adlp:         NOTRUN -> [FAIL][230] ([Intel XE#2136])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_module_load@reload.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#1201] / [Intel XE#2419]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#2419]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#2419]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#1201] / [Intel XE#977])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#977])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#977])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][238] -> [SKIP][239] ([Intel XE#1130] / [Intel XE#1201]) +35 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-lnl:          [PASS][240] -> [FAIL][241] ([Intel XE#1924] / [Intel XE#2028])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#2284] / [Intel XE#366])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][243] -> [ABORT][244] ([Intel XE#1358] / [Intel XE#1607])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_pm@s4-basic.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][246] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][248] -> [DMESG-WARN][249] ([Intel XE#2019])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#1201] / [Intel XE#579])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#579])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#1201] / [Intel XE#579])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#944]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_render_copy@render-hstripes:
    - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#1130] / [Intel XE#1201]) +6 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_render_copy@render-hstripes.html

  * igt@xe_vm@shared-pte-page:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][257] ([Intel XE#2226]) +1 other test dmesg-warn
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_vm@shared-pte-page.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@core_hotunplug@hotreplug.html
    - shard-lnl:          [SKIP][260] ([Intel XE#1885]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@core_hotunplug@hotreplug.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-lnl:          [SKIP][262] -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@core_setmaster@master-drop-set-shared-fd.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][264] ([Intel XE#1701]) -> [PASS][265] +1 other test pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][266] ([Intel XE#1426]) -> [PASS][267] +3 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][268] ([Intel XE#1426]) -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201]) -> [PASS][271] +9 other tests pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-adlp:         [INCOMPLETE][272] ([Intel XE#1195]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [i915#2575]) -> [PASS][275] +7 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-lnl:          [SKIP][276] ([Intel XE#2351]) -> [PASS][277] +23 other tests pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_draw_crc@draw-method-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][279] +23 other tests pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][280] ([Intel XE#2049]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][283] +6 other tests pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#455]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-adlp:         [SKIP][286] ([Intel XE#1201]) -> [PASS][287] +65 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][288] ([Intel XE#324]) -> [PASS][289] +1 other test pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][290] ([Intel XE#361]) -> [PASS][291] +1 other test pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-adlp:         [SKIP][292] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][294] ([Intel XE#718]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][296] ([Intel XE#2423]) -> [PASS][297] +30 other tests pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][298] ([Intel XE#899]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - shard-lnl:          [FAIL][300] ([Intel XE#2028]) -> [PASS][301] +10 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][302] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][304] ([Intel XE#1473]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][306] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind:
    - shard-adlp:         [DMESG-WARN][308] ([Intel XE#2226]) -> [PASS][309] +3 other tests pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [SKIP][310] ([Intel XE#1130]) -> [PASS][311] +68 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-lnl:          [DMESG-WARN][312] -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_exec_reset@close-execqueues-close-fd.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-adlp:         [SKIP][314] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][315] +27 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [FAIL][316] ([Intel XE#2256]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][318] ([Intel XE#1794]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_vm@bind-one-bo-many-times:
    - shard-adlp:         [DMESG-WARN][320] ([Intel XE#1727] / [Intel XE#2226]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_vm@bind-one-bo-many-times.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_vm@bind-one-bo-many-times.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][323] +56 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-adlp:         [SKIP][324] ([Intel XE#1201]) -> [DMESG-WARN][325] ([Intel XE#2226])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-32.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#873]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#873])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][329] ([Intel XE#316])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#316]) -> [SKIP][331] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][332] ([Intel XE#1201]) -> [SKIP][333] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         [SKIP][334] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][335] ([Intel XE#1201]) +5 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][336] ([Intel XE#1407]) -> [SKIP][337] ([Intel XE#2351]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [SKIP][338] ([Intel XE#2351]) -> [DMESG-WARN][339] ([Intel XE#1725])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][341] ([Intel XE#1201]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1201]) -> [SKIP][343] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          [SKIP][344] ([Intel XE#2351]) -> [SKIP][345] ([Intel XE#1407]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][346] ([Intel XE#1231]) -> [SKIP][347] ([Intel XE#1201])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][348] ([Intel XE#2351]) -> [SKIP][349] ([Intel XE#1124]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][350] ([Intel XE#1201]) -> [SKIP][351] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1201]) -> [SKIP][353] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1124]) -> [SKIP][355] ([Intel XE#1201])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][357] ([Intel XE#1201]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][358] ([Intel XE#1231]) -> [FAIL][359] ([Intel XE#1242])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][360] ([Intel XE#1874]) -> [SKIP][361] ([Intel XE#1201]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][362] ([Intel XE#1124]) -> [SKIP][363] ([Intel XE#2351]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#1124]) -> [SKIP][365] ([Intel XE#1201] / [Intel XE#2351])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#1124]) -> [SKIP][367] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][368] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][369] ([Intel XE#1201]) +8 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][371] ([Intel XE#619])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][373] ([Intel XE#1124]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#346]) -> [SKIP][375] ([Intel XE#1201] / [Intel XE#346])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][377] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][379] ([Intel XE#367]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][380] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][381] ([Intel XE#1201]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][383] ([Intel XE#1201] / [i915#2575])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-lnl:          [SKIP][384] ([Intel XE#2191]) -> [SKIP][385] ([Intel XE#2423]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#2191]) -> [SKIP][387] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#367]) -> [SKIP][389] ([Intel XE#1201] / [Intel XE#367])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][391] ([Intel XE#367])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
    - shard-adlp:         [SKIP][392] ([Intel XE#1201]) -> [SKIP][393] ([Intel XE#1201] / [Intel XE#367])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#1201] / [i915#2575]) -> [SKIP][395] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][397] ([Intel XE#1201] / [i915#2575])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          [SKIP][398] ([Intel XE#1512]) -> [SKIP][399] ([Intel XE#2423]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-adlp:         [SKIP][400] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][401] ([Intel XE#1201])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#787]) -> [SKIP][403] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][405] ([Intel XE#787]) +41 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][406] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][407] ([Intel XE#1201]) +11 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][408] ([Intel XE#1201]) -> [SKIP][409] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1201]) -> [SKIP][411] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][413] ([Intel XE#1201] / [Intel XE#2351])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][415] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][417] ([Intel XE#1252]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][418] ([Intel XE#1399]) -> [SKIP][419] ([Intel XE#2351]) +10 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][420] ([Intel XE#2351]) -> [SKIP][421] ([Intel XE#1399]) +4 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][423] ([Intel XE#1201]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][425] ([Intel XE#1201])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][427] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][428] ([Intel XE#2423]) -> [SKIP][429] ([Intel XE#306]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-adlp:         [SKIP][430] ([Intel XE#1201]) -> [SKIP][431] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_color@ctm-blue-to-red.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#1201] / [i915#2575]) -> [SKIP][433] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][435] ([Intel XE#306]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][437] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#373]) -> [SKIP][439] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          [SKIP][440] ([Intel XE#373]) -> [SKIP][441] ([Intel XE#2423]) +5 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-adlp:         [SKIP][442] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][443] ([Intel XE#1201]) +5 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][445] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-fast.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         [SKIP][446] ([Intel XE#1201]) -> [SKIP][447] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#1201] / [i915#2575]) -> [SKIP][449] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][451] ([Intel XE#373])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          [SKIP][452] ([Intel XE#2423]) -> [SKIP][453] ([Intel XE#373]) +6 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][455] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +3 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][457] ([Intel XE#373]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][459] ([Intel XE#1201] / [Intel XE#307])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          [SKIP][460] ([Intel XE#2423]) -> [SKIP][461] ([Intel XE#307])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         [SKIP][462] ([Intel XE#1201]) -> [SKIP][463] ([Intel XE#1201] / [Intel XE#307])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         [SKIP][464] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][465] ([Intel XE#1201])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][466] ([Intel XE#1413]) -> [SKIP][467] ([Intel XE#2423]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-adlp:         [SKIP][468] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][469] ([Intel XE#1201]) +2 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          [SKIP][470] ([Intel XE#1424]) -> [SKIP][471] ([Intel XE#2423]) +2 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-adlp:         [SKIP][472] ([Intel XE#1201]) -> [SKIP][473] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-lnl:          [SKIP][474] ([Intel XE#2423]) -> [SKIP][475] ([Intel XE#1424])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][477] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#455]) -> [SKIP][479] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         [SKIP][480] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][481] ([Intel XE#1201]) +4 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         [SKIP][482] ([Intel XE#1201]) -> [SKIP][483] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][485] ([Intel XE#1201] / [Intel XE#323])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          [SKIP][486] ([Intel XE#2423]) -> [SKIP][487] ([Intel XE#323]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-adlp:         [SKIP][488] ([Intel XE#1201]) -> [SKIP][489] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          [SKIP][490] ([Intel XE#309]) -> [SKIP][491] ([Intel XE#2423]) +2 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          [SKIP][492] ([Intel XE#2423]) -> [SKIP][493] ([Intel XE#309]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][495] ([Intel XE#323])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#307]) -> [SKIP][497] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#1201] / [i915#3804]) -> [SKIP][499] ([i915#3804])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#455]) -> [SKIP][501] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_dsc@dsc-basic.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][503] ([Intel XE#1201] / [Intel XE#701])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          [SKIP][504] ([Intel XE#2423]) -> [SKIP][505] ([Intel XE#701])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_feature_discovery@chamelium.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         [SKIP][506] ([Intel XE#1201]) -> [SKIP][507] ([Intel XE#1201] / [Intel XE#701])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_feature_discovery@chamelium.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][509] ([Intel XE#1201] / [i915#2575])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          [SKIP][510] ([Intel XE#1138]) -> [SKIP][511] ([Intel XE#2423])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_feature_discovery@display-4x.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_feature_discovery@display-4x.html
    - shard-adlp:         [SKIP][512] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][513] ([Intel XE#1201])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_feature_discovery@display-4x.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         [SKIP][514] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][515] ([Intel XE#1201])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_feature_discovery@psr1.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][517] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          [SKIP][518] ([Intel XE#1421]) -> [SKIP][519] ([Intel XE#2423]) +2 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html
    - shard-adlp:         [SKIP][520] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][521] ([Intel XE#1201]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_flip@2x-flip-vs-rmfb.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][522] ([Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][523] ([Intel XE#1551])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][524] ([Intel XE#1551]) -> [SKIP][525] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#1201]) -> [SKIP][527] ([Intel XE#1201] / [Intel XE#455])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
    - shard-lnl:          [SKIP][528] ([Intel XE#2351]) -> [SKIP][529] ([Intel XE#1401] / [Intel XE#1745])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][531] ([Intel XE#455]) +3 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][532] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][533] ([Intel XE#2351]) +2 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][534] ([Intel XE#324]) -> [SKIP][535] ([Intel XE#1201])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          [SKIP][536] ([Intel XE#2423]) -> [SKIP][537] ([Intel XE#352])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][539] ([Intel XE#651]) +18 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][541] ([Intel XE#1201]) +6 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][542] ([Intel XE#1201]) -> [SKIP][543] ([Intel XE#1201] / [Intel XE#656]) +17 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#1201]) -> [SKIP][545] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][547] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][548] ([Intel XE#1861]) -> [SKIP][549] ([Intel XE#1201]) +1 other test skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][550] ([Intel XE#1201]) -> [FAIL][551] ([Intel XE#1861]) +1 other test fail
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [SKIP][552] ([Intel XE#656]) -> [SKIP][553] ([Intel XE#2351]) +20 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][554] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][555] ([Intel XE#1201]) +23 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [FAIL][556] ([Intel XE#616]) -> [SKIP][557] ([Intel XE#1201])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][558] ([Intel XE#1201]) -> [SKIP][559] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          [SKIP][560] ([Intel XE#651]) -> [SKIP][561] ([Intel XE#2351]) +5 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][562] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][563] ([Intel XE#1201]) +7 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][565] ([Intel XE#651])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][567] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][568] ([Intel XE#2351]) -> [SKIP][569] ([Intel XE#651]) +3 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#651]) -> [SKIP][571] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][573] ([Intel XE#2351])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][574] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][575] ([Intel XE#1201]) +11 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#653]) -> [SKIP][577] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][579] ([Intel XE#653]) +1 other test skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][581] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][582] ([Intel XE#2351]) -> [SKIP][583] ([Intel XE#656]) +17 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][585] ([Intel XE#658])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][586] ([Intel XE#1201]) -> [SKIP][587] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#1201]) -> [SKIP][589] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][591] ([Intel XE#653]) +15 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][593] ([Intel XE#2351])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][595] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#653]) -> [SKIP][597] ([Intel XE#1201])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][599] ([Intel XE#1201]) +10 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          [SKIP][600] ([Intel XE#2423]) -> [SKIP][601] ([Intel XE#2340])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_getfb@getfb2-accept-ccs.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-adlp:         [SKIP][602] ([Intel XE#1201]) -> [SKIP][603] ([Intel XE#1201] / [Intel XE#1339])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][604] ([Intel XE#599]) -> [SKIP][605] ([Intel XE#2423])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         [SKIP][606] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][607] ([Intel XE#1201])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][609] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          [SKIP][610] ([Intel XE#356]) -> [SKIP][611] ([Intel XE#2423])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][613] ([Intel XE#1162])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][614] ([Intel XE#1035] / [Intel XE#1195]) -> [SKIP][615] ([Intel XE#1201])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [DMESG-WARN][616] ([Intel XE#324]) -> [SKIP][617] ([Intel XE#2423])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][619] ([Intel XE#1201] / [i915#2575])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_plane_alpha_blend@alpha-basic.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#1201] / [i915#2575]) -> [SKIP][621] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-lnl:          [SKIP][622] ([Intel XE#2423]) -> [SKIP][623] ([Intel XE#498])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-adlp:         [SKIP][624] ([Intel XE#1201]) -> [SKIP][625] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-lnl:          [SKIP][626] ([Intel XE#498]) -> [SKIP][627] ([Intel XE#2423])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#2318]) -> [SKIP][629] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][631] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][633] ([Intel XE#2318]) +2 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][635] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][636] ([Intel XE#2318]) -> [SKIP][637] ([Intel XE#2423])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][639] ([Intel XE#870]) +1 other test skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#1122]) -> [SKIP][641] ([Intel XE#1122] / [Intel XE#1201])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][642] ([Intel XE#2351]) -> [SKIP][643] ([Intel XE#1131])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][645] ([Intel XE#1489]) +1 other test skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][647] ([Intel XE#1201]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#1489]) -> [SKIP][649] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#1201]) -> [SKIP][651] ([Intel XE#1122] / [Intel XE#1201])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          [SKIP][652] ([Intel XE#2351]) -> [SKIP][653] ([Intel XE#1128])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         [SKIP][654] ([Intel XE#1201]) -> [SKIP][655] ([Intel XE#1122] / [Intel XE#1201])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         [SKIP][656] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][657] ([Intel XE#1201])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-lnl:          [SKIP][658] ([Intel XE#1128]) -> [SKIP][659] ([Intel XE#2351])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          [SKIP][660] ([Intel XE#2351]) -> [SKIP][661] ([Intel XE#1406]) +1 other test skip
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][663] ([Intel XE#1201]) +3 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#929]) -> [SKIP][665] ([Intel XE#1201])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#929]) -> [SKIP][667] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#1201]) -> [SKIP][669] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-render:
    - shard-adlp:         [SKIP][670] ([Intel XE#1201]) -> [SKIP][671] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_psr@pr-cursor-render.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         [SKIP][672] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][673] ([Intel XE#1201]) +8 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html
    - shard-dg2-set2:     [SKIP][674] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][675] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          [SKIP][676] ([Intel XE#1406]) -> [SKIP][677] ([Intel XE#2351]) +2 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr@pr-sprite-plane-move.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][678] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][679] ([Intel XE#929]) +8 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-render:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#1201]) -> [SKIP][681] ([Intel XE#929])
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_psr@psr-sprite-render.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@psr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][682] ([Intel XE#1201]) -> [SKIP][683] ([Intel XE#1149] / [Intel XE#1201])
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [SKIP][684] ([Intel XE#1201]) -> [FAIL][685] ([Intel XE#1874]) +1 other test fail
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         [SKIP][686] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][687] ([Intel XE#1201])
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][689] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          [SKIP][690] ([Intel XE#1127]) -> [SKIP][691] ([Intel XE#2423])
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][692] ([Intel XE#327]) -> [SKIP][693] ([Intel XE#1201] / [Intel XE#327])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][694] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][695] ([Intel XE#327]) +1 other test skip
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][696] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][697] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-lnl:          [SKIP][698] ([Intel XE#1437]) -> [SKIP][699] ([Intel XE#2423]) +1 other test skip
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][700] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][701] ([Intel XE#1201]) +1 other test skip
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     [SKIP][702] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][703] ([Intel XE#1201] / [i915#2575])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][704] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][705] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][706] ([Intel XE#1500]) -> [SKIP][707] ([Intel XE#1201] / [Intel XE#1500])
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][708] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][709] ([Intel XE#330])
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][710] ([Intel XE#1201] / [i915#2575]) -> [SKIP][711] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         [SKIP][712] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][713] ([Intel XE#1201]) +6 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_vrr@flip-suspend.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][714] ([Intel XE#756]) -> [SKIP][715] ([Intel XE#1201] / [Intel XE#756])
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][716] ([Intel XE#1091]) -> [SKIP][717] ([Intel XE#1201] / [i915#2575])
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          [SKIP][718] ([Intel XE#1091]) -> [SKIP][719] ([Intel XE#2423])
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         [SKIP][720] ([Intel XE#1201]) -> [SKIP][721] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         [SKIP][722] ([Intel XE#1201] / [Intel XE#1447]) -> [SKIP][723] ([Intel XE#1130] / [Intel XE#1201])
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html
    - shard-dg2-set2:     [FAIL][724] ([Intel XE#1050]) -> [SKIP][725] ([Intel XE#1130])
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [FAIL][726] ([Intel XE#1050]) -> [SKIP][727] ([Intel XE#1130] / [Intel XE#1201])
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          [SKIP][728] ([Intel XE#1447]) -> [SKIP][729] ([Intel XE#1130]) +1 other test skip
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][730] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][731] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         [SKIP][732] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][733] ([Intel XE#1201])
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfd.html
    - shard-dg2-set2:     [SKIP][734] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][735] ([Intel XE#1130])
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][736] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][737] ([Intel XE#1126])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][738] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][739] ([Intel XE#1473] / [Intel XE#392])
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          [SKIP][740] ([Intel XE#688]) -> [SKIP][741] ([Intel XE#1130]) +4 other tests skip
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_evict@evict-beng-large-external-cm.html
    - shard-adlp:         [SKIP][742] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][743] ([Intel XE#1201]) +4 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         [SKIP][744] ([Intel XE#1201]) -> [SKIP][745] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-dg2-set2:     [SKIP][746] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][747] ([Intel XE#1600])
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][748] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][749] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [FAIL][750] ([Intel XE#1000]) -> [SKIP][751] ([Intel XE#1130] / [Intel XE#1201])
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         [SKIP][752] ([Intel XE#1201] / [Intel XE#688]) -> [SKIP][753] ([Intel XE#1201])
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          [SKIP][754] ([Intel XE#1130]) -> [SKIP][755] ([Intel XE#688]) +4 other tests skip
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - shard-adlp:         [SKIP][756] ([Intel XE#1201]) -> [SKIP][757] ([Intel XE#1201] / [Intel XE#688])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-adlp:         [SKIP][758] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][759] ([Intel XE#1201]) +4 other tests skip
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          [SKIP][760] ([Intel XE#1130]) -> [SKIP][761] ([Intel XE#1392]) +3 other tests skip
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
    - shard-adlp:         [SKIP][762] ([Intel XE#1201]) -> [SKIP][763] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          [SKIP][764] ([Intel XE#1392]) -> [SKIP][765] ([Intel XE#1130]) +4 other tests skip
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     [SKIP][766] ([Intel XE#288]) -> [SKIP][767] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         [SKIP][768] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][769] ([Intel XE#1201]) +18 other tests skip
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][770] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][771] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][772] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][773] ([Intel XE#288]) +13 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-adlp:         [SKIP][774] ([Intel XE#1201]) -> [SKIP][775] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][776] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][777] ([Intel XE#1130]) +2 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
    - shard-adlp:         [SKIP][778] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][779] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][780] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][781] ([Intel XE#1130] / [Intel XE#1201]) +11 other tests skip
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][782] ([Intel XE#288]) -> [SKIP][783] ([Intel XE#1130] / [Intel XE#1201]) +3 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-adlp:         [SKIP][784] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][785] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][786] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][787] ([Intel XE#288]) +2 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][788] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][789] ([Intel XE#1130])
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
    - shard-adlp:         [SKIP][790] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][791] ([Intel XE#1201])
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][792] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][793] ([Intel XE#2360]) +1 other test skip
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [SKIP][794] ([Intel XE#1130] / [Intel XE#1201]) -> [TIMEOUT][795] ([Intel XE#2105])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          [SKIP][796] ([Intel XE#584]) -> [SKIP][797] ([Intel XE#1130]) +1 other test skip
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_gt_freq@freq_suspend.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         [FAIL][798] ([Intel XE#1204] / [Intel XE#2136]) -> [DMESG-FAIL][799] ([Intel XE#2226])
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_module_load@reload-no-display.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][800] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][801] ([Intel XE#2419]) +2 other tests skip
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][802] ([Intel XE#2419]) -> [SKIP][803] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@userptr-coh-none:
    - shard-adlp:         [DMESG-WARN][804] ([Intel XE#2226]) -> [SKIP][805] ([Intel XE#1130] / [Intel XE#1201])
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_pat@userptr-coh-none.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_pat@userptr-coh-none.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][806] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][807] ([Intel XE#1130]) +2 other tests skip
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          [SKIP][808] ([Intel XE#1130]) -> [SKIP][809] ([Intel XE#584])
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@xe_pm@s3-basic.html
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][810] ([Intel XE#1162] / [Intel XE#1941]) -> [SKIP][811] ([Intel XE#1130] / [Intel XE#1201])
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [SKIP][812] ([Intel XE#1130] / [Intel XE#1201]) -> [ABORT][813] ([Intel XE#1358])
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][814] ([Intel XE#1794]) -> [SKIP][815] ([Intel XE#1130] / [Intel XE#1201])
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][816] ([Intel XE#944]) -> [SKIP][817] ([Intel XE#1201] / [Intel XE#944])
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         [SKIP][818] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][819] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     [SKIP][820] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][821] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          [SKIP][822] ([Intel XE#944]) -> [SKIP][823] ([Intel XE#1130]) +1 other test skip
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][824] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][825] ([Intel XE#944]) +1 other test skip
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][826] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][827] ([Intel XE#1201] / [Intel XE#944])
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-lnl:          [SKIP][828] ([Intel XE#1130]) -> [SKIP][829] ([Intel XE#944])
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-adlp:         [SKIP][830] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][831] ([Intel XE#1201] / [Intel XE#944])
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
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
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2420
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
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
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
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_7944 -> IGT_7945
  * Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -> xe-pw-136738v1

  IGT_7944: 7944
  IGT_7945: 7945
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338
  xe-pw-136738v1: 136738v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/index.html

--===============3946599230987022065==
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
<tr><td><b>Series:</b></td><td>drm: Use backlight power constants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136738/">https://patchwork.freedesktop.org/series/136738/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_full -&gt; xe-pw-136738v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136738v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136738v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136738v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> +2 other tests fail</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@core_getversion@all-cards.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_pm_rpm@basic-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136738v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_balancer@twice-cm-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_basic@many-execqueues-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-null-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_compute_mode@once-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_exec_compute_mode@once-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_threads@threads-bal-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_threads@threads-hang-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_exec_threads@threads-userptr-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_gt_freq@freq_range_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_gt_freq@freq_range_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203">Intel XE#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@purge-bb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_intel_bb@purge-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_intel_bb@purge-bb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2420">Intel XE#2420</a>) +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2420">Intel XE#2420</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-hstripes:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_render_copy@render-hstripes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_vm@shared-pte-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@core_hotunplug@hotreplug.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_draw_crc@draw-method-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_draw_crc@draw-method-blt.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +65 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> +68 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256">Intel XE#2256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_vm@bind-one-bo-many-times.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_vm@bind-one-bo-many-times.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_addfb_basic@bad-pitch-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-8/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_pat@userptr-coh-none.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_pat@userptr-coh-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-1/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-4/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-lnl-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7944 -&gt; IGT_7945</li>
<li>Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -&gt; xe-pw-136738v1</li>
</ul>
<p>IGT_7944: 7944<br />
  IGT_7945: 7945<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338<br />
  xe-pw-136738v1: 136738v1</p>

</body>
</html>

--===============3946599230987022065==--
