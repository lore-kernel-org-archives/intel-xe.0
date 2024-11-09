Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86E8D5C0C7
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 04:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A37210E03F;
	Sat,  9 Nov 2024 04:13:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285910E03F;
 Sat,  9 Nov 2024 04:13:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6080914616374437789=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_convert_dis?=
 =?utf-8?q?play_feature_helpers_to_struct_intel=5Fdisplay_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 04:13:04 -0000
Message-ID: <173112558445.1575319.11099082627102830496@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731015333.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731015333.git.jani.nikula@intel.com>
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

--===============6080914616374437789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: convert display feature helpers to struct intel_display (rev4)
URL   : https://patchwork.freedesktop.org/series/140887/
State : failure

== Summary ==

CI Bug Log - changes from xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97_full -> xe-pw-140887v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140887v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140887v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140887v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@torture-move@all-pipes:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-435/igt@kms_cursor_legacy@torture-move@all-pipes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_cursor_legacy@torture-move@all-pipes.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  
#### Warnings ####

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#2423] / [i915#2575]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  
Known issues
------------

  Here are the changes found in xe-pw-140887v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#2134])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@fbdev@unaligned-write.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#827]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#3194]) +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1426])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1454])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#877])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#316])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][23] ([Intel XE#3194])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][24] ([Intel XE#1874])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2887])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#2907])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +107 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1195] / [Intel XE#1727])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1195])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] ([Intel XE#3113])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#787]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#314]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-5.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2321])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#2423] / [i915#2575]) +53 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#309])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [PASS][51] -> [DMESG-WARN][52] ([Intel XE#3184]) +1 other test dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#2932])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2244])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#702])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#310])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#301]) +5 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#301]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-lnl:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2929]) +1 other test dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1401] / [Intel XE#1745])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1401])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#2351])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_frontbuffer_tracking@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2311]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#2351] / [Intel XE#2890]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2890]) +13 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2890]) +10 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#656]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#653]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2313]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#2925])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2763]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2763] / [Intel XE#455])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2763]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#2446]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1439] / [Intel XE#3141])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][91] -> [DMESG-WARN][92] ([Intel XE#2042])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-lnl:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2932])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1489]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2387])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1406])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel XE#2850])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_psr@psr2-dpms.html

  * igt@kms_sequence@queue-idle@pipe-c-edp-1:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2467]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-8/igt@kms_sequence@queue-idle@pipe-c-edp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-6/igt@kms_sequence@queue-idle@pipe-c-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1435])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#362])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#899])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1123])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          NOTRUN -> [FAIL][108] ([Intel XE#2667])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2905])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2905])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#261] / [Intel XE#688])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][112] -> [TIMEOUT][113] ([Intel XE#1473])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][114] -> [TIMEOUT][115] ([Intel XE#1473] / [Intel XE#2472])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#688])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-dg2-set2:     [PASS][117] -> [DMESG-WARN][118] ([Intel XE#358])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#688])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#1130]) +86 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_exec_basic@many-execqueues-many-vm-basic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1392])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1392])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2322]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#288]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][126] -> [FAIL][127] ([Intel XE#1630]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [FAIL][128] ([Intel XE#1630])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#1630]) +3 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1130]) +20 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2360])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#3184]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][135] -> [FAIL][136] ([Intel XE#2136])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_module_load@many-reload.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2541])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2248])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][139] ([Intel XE#1173])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#2284] / [Intel XE#366])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-basic:
    - shard-adlp:         [PASS][141] -> [DMESG-WARN][142] ([Intel XE#3086]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-2/igt@xe_pm@d3hot-basic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-4/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][143] -> [ABORT][144] ([Intel XE#1358] / [Intel XE#1607])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         [PASS][145] -> [ABORT][146] ([Intel XE#1358] / [Intel XE#1607])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][147] -> [FAIL][148] ([Intel XE#958])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#944])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2423]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@core_getclient.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@core_getclient.html

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1885]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@core_hotunplug@hotrebind.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#3130] / [Intel XE#3249]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2134]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@fbdev@unaligned-read.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@fbdev@unaligned-read.html

  * igt@kms_addfb_basic@no-handle:
    - shard-adlp:         [DMESG-WARN][158] ([Intel XE#3086]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-4/igt@kms_addfb_basic@no-handle.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-2/igt@kms_addfb_basic@no-handle.html

  * igt@kms_color@ctm-0-75@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][160] ([Intel XE#2929]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-c-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][162] ([Intel XE#877]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2423] / [i915#2575]) -> [PASS][165] +41 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_flip@busy-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][166] ([Intel XE#886]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][168] ([Intel XE#301]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][170] ([Intel XE#2597]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][174] ([Intel XE#2882]) -> [PASS][175] +4 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][177] +5 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][178] ([Intel XE#1874]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2890]) -> [PASS][181] +18 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#455]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#2446]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1130]) -> [PASS][187] +97 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][188] ([Intel XE#3320]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][190] ([Intel XE#1630]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [FAIL][192] ([Intel XE#1630]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-adlp:         [TIMEOUT][194] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][196] ([Intel XE#2998]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-FAIL][198] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][200] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][202] ([Intel XE#1794]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2423] / [i915#2575]) -> [SKIP][205] ([Intel XE#623])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2423] / [i915#2575]) -> [SKIP][207] ([Intel XE#873])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2423] / [i915#2575]) -> [FAIL][209] ([Intel XE#1426])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][211] ([Intel XE#316])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#316]) -> [SKIP][213] ([Intel XE#2890])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#316]) -> [SKIP][215] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [DMESG-WARN][216] ([Intel XE#1725]) -> [DMESG-FAIL][217] ([Intel XE#1725])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#2890]) -> [SKIP][219] ([Intel XE#316]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][220] ([Intel XE#3194]) -> [FAIL][221] ([Intel XE#1231] / [Intel XE#1242])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1124]) -> [SKIP][223] ([Intel XE#2351] / [Intel XE#2890])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][225] ([Intel XE#619])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][226] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052]) -> [FAIL][227] ([Intel XE#1242] / [Intel XE#3052])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][229] ([Intel XE#1124]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1124]) -> [SKIP][231] ([Intel XE#2890]) +5 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2890]) -> [SKIP][233] ([Intel XE#1124]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2423] / [i915#2575]) -> [SKIP][235] ([Intel XE#367])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2423] / [i915#2575]) -> [SKIP][237] ([Intel XE#2191])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2191]) -> [SKIP][239] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#367]) -> [SKIP][241] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][243] ([Intel XE#2890]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2907]) -> [SKIP][245] ([Intel XE#2890])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][247] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2890]) -> [SKIP][249] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2423] / [i915#2575]) -> [SKIP][251] ([Intel XE#306])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#306]) -> [SKIP][253] ([Intel XE#2423] / [i915#2575])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2423] / [i915#2575]) -> [SKIP][255] ([Intel XE#373]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#373]) -> [SKIP][257] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#307]) -> [SKIP][259] ([Intel XE#2423] / [i915#2575])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][260] ([Intel XE#1178]) -> [SKIP][261] ([Intel XE#2423] / [i915#2575])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_content_protection@legacy.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#308]) -> [SKIP][263] ([Intel XE#2423] / [i915#2575])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#455]) -> [SKIP][265] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2890]) -> [SKIP][267] ([Intel XE#455])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#776]) -> [SKIP][269] ([Intel XE#2890])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#703]) -> [SKIP][271] ([Intel XE#2423] / [i915#2575])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][272] ([Intel XE#301]) -> [SKIP][273] ([Intel XE#2423] / [i915#2575])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#455]) -> [SKIP][275] ([Intel XE#2351] / [Intel XE#2890])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][277] ([Intel XE#455]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#455]) -> [SKIP][279] ([Intel XE#2890]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][280] ([i915#5274]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2890]) -> [SKIP][283] ([Intel XE#651]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#651]) -> [SKIP][285] ([Intel XE#2890]) +10 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][287] ([Intel XE#651]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][288] ([Intel XE#1861]) -> [TIMEOUT][289] ([Intel XE#1033] / [Intel XE#1727])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][290] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][291] ([Intel XE#1861])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][293] ([Intel XE#658])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#651]) -> [SKIP][295] ([Intel XE#2351] / [Intel XE#2890]) +7 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][296] ([Intel XE#653]) -> [TIMEOUT][297] ([Intel XE#1033] / [Intel XE#1727])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][299] ([Intel XE#653]) +5 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2890]) -> [SKIP][301] ([Intel XE#653]) +12 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#653]) -> [SKIP][303] ([Intel XE#2890]) +4 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#653]) -> [SKIP][305] ([Intel XE#2351] / [Intel XE#2890]) +11 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#605]) -> [SKIP][307] ([Intel XE#2423] / [i915#2575])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2423] / [i915#2575]) -> [SKIP][309] ([Intel XE#356])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][310] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][311] ([Intel XE#1035])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][313] ([Intel XE#2423] / [i915#2575])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2423] / [i915#2575]) -> [SKIP][315] ([Intel XE#2763] / [Intel XE#455])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2890]) -> [SKIP][317] ([Intel XE#870])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2890]) -> [SKIP][319] ([Intel XE#908])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1489]) -> [SKIP][321] ([Intel XE#2890]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2890]) -> [SKIP][323] ([Intel XE#1489]) +6 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2890]) -> [SKIP][325] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][327] ([Intel XE#2890]) +7 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][329] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][331] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2351]) -> [SKIP][333] ([Intel XE#2850] / [Intel XE#929])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][334] -> [SKIP][335] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][336] ([Intel XE#2426]) -> [FAIL][337] ([Intel XE#1729])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2423] / [i915#2575]) -> [SKIP][339] ([Intel XE#362])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2423] / [i915#2575]) -> [SKIP][341] ([Intel XE#2168])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_vrr@cmrr.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2423] / [i915#2575]) -> [SKIP][343] ([Intel XE#455]) +8 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2423] / [i915#2575]) -> [SKIP][345] ([Intel XE#756])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][347] ([Intel XE#1130])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#1123]) -> [SKIP][349] ([Intel XE#1130])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1130]) -> [SKIP][351] ([Intel XE#1126])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2905]) -> [SKIP][353] ([Intel XE#1130]) +5 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][354] ([Intel XE#1473]) -> [FAIL][355] ([Intel XE#1000])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#288]) -> [SKIP][357] ([Intel XE#1130]) +17 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1130]) -> [SKIP][359] ([Intel XE#288]) +12 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1130]) -> [SKIP][361] ([Intel XE#2905]) +6 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#455]) -> [SKIP][363] ([Intel XE#1192])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-464/igt@xe_live_ktest@xe_eudebug.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#560]) -> [SKIP][365] ([Intel XE#1130])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#1130]) -> [SKIP][367] ([Intel XE#2541]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2541]) -> [SKIP][369] ([Intel XE#1130]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][371] ([Intel XE#1130])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1061]) -> [FAIL][373] ([Intel XE#1173])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_peer2peer@read.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][375] ([Intel XE#1130])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1130]) -> [SKIP][377] ([Intel XE#2284])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1130]) -> [ABORT][379] ([Intel XE#1358])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][380] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][381] ([Intel XE#1130])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#1130]) -> [SKIP][383] ([Intel XE#944])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#944]) -> [SKIP][385] ([Intel XE#1130]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#3342]) -> [SKIP][387] ([Intel XE#1130]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1454]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97 -> xe-pw-140887v4

  IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97: 85b1b17ed748e1f68ac83052916a95d624405c97
  xe-pw-140887v4: 140887v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/index.html

--===============6080914616374437789==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: convert display feature helpers to struct intel_display (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140887/">https://patchwork.freedesktop.org/series/140887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97_full -&gt; xe-pw-140887v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140887v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140887v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140887v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@torture-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-435/igt@kms_cursor_legacy@torture-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_cursor_legacy@torture-move@all-pipes.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140887v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454">Intel XE#1454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-8/igt@kms_sequence@queue-idle@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-6/igt@kms_sequence@queue-idle@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467">Intel XE#2467</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-2/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-4/igt@xe_pm@d3hot-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@core_getclient.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@core_hotunplug@hotrebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-4/igt@kms_addfb_basic@no-handle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-2/igt@kms_addfb_basic@no-handle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_flip@busy-flip.html">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-6/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> +97 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-464/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-466/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v4/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97 -&gt; xe-pw-140887v4</li>
</ul>
<p>IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97: 85b1b17ed748e1f68ac83052916a95d624405c97<br />
  xe-pw-140887v4: 140887v4</p>

</body>
</html>

--===============6080914616374437789==--
