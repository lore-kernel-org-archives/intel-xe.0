Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF6D5E37F
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 21:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F418B10E09B;
	Sat,  9 Nov 2024 21:10:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D041610E09B;
 Sat,  9 Nov 2024 21:10:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5192064593046056159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pmu=3A_PMU_interface_for?=
 =?utf-8?q?_Xe_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 21:10:30 -0000
Message-ID: <173118663083.1875794.11175847876142649866@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
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

--===============5192064593046056159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: PMU interface for Xe (rev4)
URL   : https://patchwork.freedesktop.org/series/139121/
State : failure

== Summary ==

CI Bug Log - changes from xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25_full -> xe-pw-139121v4_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-139121v4_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139121v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139121v4_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][1] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#2423] / [i915#2575]) -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  
Known issues
------------

  Here are the changes found in xe-pw-139121v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#1885]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@core_hotunplug@hotreplug.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2134]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@fbdev@write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2550]) +11 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2890]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1874]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1231] / [Intel XE#1242])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1231] / [Intel XE#1242]) +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1874]) +4 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +117 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#787]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#2907]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1195] / [Intel XE#1727])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1195] / [Intel XE#3113])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-lnl:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2929]) +3 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-5/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1188])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2321]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#308]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2423] / [i915#2575]) +94 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#309]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#877]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][55] -> [FAIL][56] ([Intel XE#1475])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#3009])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2244])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1135])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][61] -> [FAIL][62] ([Intel XE#301]) +3 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#301]) +4 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#310]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#2890]) +33 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#455]) +8 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#1491]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2311]) +8 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#651]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#1861])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#2351] / [Intel XE#2890]) +10 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#656]) +14 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#2333]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#653]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#653]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#605])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#346])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][85] ([Intel XE#1035])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][86] ([Intel XE#2078]) +1 other test warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2763]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [PASS][89] -> [DMESG-WARN][90] ([Intel XE#3184]) +1 other test dmesg-warn
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-5/igt@kms_pm_backlight@fade-with-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#718])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2446]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#2446]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1489]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#929])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_psr@psr2-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1127])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][102] -> [FAIL][103] ([Intel XE#771] / [Intel XE#899])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#899]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][106] -> [FAIL][107] ([Intel XE#899])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1123])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1123])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2905]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2905]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2905])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][113] -> [TIMEOUT][114] ([Intel XE#1473])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@xe_evict@evict-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [PASS][116] -> [FAIL][117] ([Intel XE#2364])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#1130]) +166 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1392]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1392])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2322]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][123] -> [FAIL][124] ([Intel XE#1630]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#288]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#1630]) +2 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#288]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][129] -> [TIMEOUT][130] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][131] ([Intel XE#1999]) +2 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2541]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2541]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][134] -> [ABORT][135] ([Intel XE#1694] / [Intel XE#1794])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][136] -> [ABORT][137] ([Intel XE#1794])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#944]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#944])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#944]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [PASS][141] -> [FAIL][142] ([Intel XE#1081])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration.html

  * igt@xe_vm@large-userptr-split-binds-1073741824:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1130]) +15 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_vm@large-userptr-split-binds-1073741824.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][144] -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@core_getversion@all-cards.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1885]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#3130] / [Intel XE#3249]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2134]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@fbdev@nullptr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][152] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#3194]) -> [PASS][155] +3 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][156] ([Intel XE#1242]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][158] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][160] ([Intel XE#1874]) -> [PASS][161] +3 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][162] ([Intel XE#3194]) -> [PASS][163] +3 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][165] +9 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [FAIL][166] ([Intel XE#2577]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][168] ([Intel XE#1475]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][170] ([Intel XE#301]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#2423] / [i915#2575]) -> [PASS][173] +92 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip@busy-flip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][174] ([Intel XE#886]) -> [PASS][175] +7 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][176] ([Intel XE#886]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][178] ([Intel XE#1861]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2890]) -> [PASS][181] +35 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][182] ([Intel XE#718]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#2446]) -> [PASS][185] +5 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][186] ([Intel XE#2042]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-lnl:          [DMESG-WARN][188] -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_vblank@query-forked-hang:
    - shard-bmg:          [INCOMPLETE][190] -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-4/igt@kms_vblank@query-forked-hang.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][192] ([Intel XE#2159]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#2423]) -> [PASS][195] +2 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@testdisplay.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@testdisplay.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][196] ([Intel XE#1473]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:
    - shard-adlp:         [TIMEOUT][198] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1130]) -> [PASS][201] +183 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][202] ([Intel XE#1630]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][204] ([Intel XE#1630]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][206] ([Intel XE#3184]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2229]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][210] ([Intel XE#2136]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-6/igt@xe_module_load@reload.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][212] ([Intel XE#2136]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][214] ([Intel XE#1794]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [FAIL][216] ([Intel XE#2564]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@xe_pm_residency@idle-residency-on-exec.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][218] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [DMESG-WARN][219] ([Intel XE#3194])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2423] / [i915#2575]) -> [SKIP][221] ([Intel XE#873])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][223] ([Intel XE#316]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#316]) -> [SKIP][225] ([Intel XE#2890]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2890]) -> [SKIP][227] ([Intel XE#316]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][228] ([Intel XE#1242]) -> [FAIL][229] ([Intel XE#1231] / [Intel XE#1242])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][230] -> [FAIL][231] ([Intel XE#1231] / [Intel XE#1242])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][233] ([Intel XE#1124]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][235] ([Intel XE#619])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1124]) -> [SKIP][237] ([Intel XE#2890]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#619]) -> [SKIP][239] ([Intel XE#2351] / [Intel XE#2890])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#607]) -> [SKIP][241] ([Intel XE#2890])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1124]) -> [SKIP][243] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2890]) -> [SKIP][245] ([Intel XE#1124]) +6 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#367]) -> [SKIP][247] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2191]) -> [SKIP][249] ([Intel XE#2423] / [i915#2575])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2423] / [i915#2575]) -> [SKIP][251] ([Intel XE#367]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][253] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2890]) -> [SKIP][255] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][257] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][258] ([Intel XE#616]) -> [SKIP][259] ([Intel XE#2890])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2907]) -> [SKIP][261] ([Intel XE#2890])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][263] ([Intel XE#2890]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2890]) -> [SKIP][265] ([Intel XE#2907]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2423] / [i915#2575]) -> [SKIP][267] ([Intel XE#306]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#306]) -> [SKIP][269] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2423] / [i915#2575]) -> [SKIP][271] ([Intel XE#373]) +11 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#373]) -> [SKIP][273] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#307]) -> [SKIP][275] ([Intel XE#2423] / [i915#2575])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         [TIMEOUT][276] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][277] ([Intel XE#307])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [SKIP][279] ([Intel XE#307]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#455]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_content_protection@lic-type-1.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2423] / [i915#2575]) -> [FAIL][283] ([Intel XE#1188])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_content_protection@uevent.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2423] / [i915#2575]) -> [SKIP][285] ([Intel XE#308])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#323]) -> [SKIP][287] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2423] / [i915#2575]) -> [SKIP][289] ([Intel XE#323])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#455]) -> [SKIP][291] ([Intel XE#2351])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#776]) -> [SKIP][293] ([Intel XE#2890])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#703]) -> [SKIP][295] ([Intel XE#2423] / [i915#2575])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1137]) -> [SKIP][297] ([Intel XE#2423] / [i915#2575])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2423] / [i915#2575]) -> [FAIL][299] ([Intel XE#301])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][300] ([Intel XE#301]) -> [SKIP][301] ([Intel XE#2423] / [i915#2575])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#455]) -> [SKIP][303] ([Intel XE#2890]) +4 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][305] ([Intel XE#455]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2890]) -> [SKIP][307] ([Intel XE#455]) +4 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#651]) -> [SKIP][309] ([Intel XE#2890]) +21 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][311] ([Intel XE#651]) +13 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [TIMEOUT][312] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][313] ([Intel XE#1861])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][315] ([Intel XE#658])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2890]) -> [SKIP][317] ([Intel XE#651]) +24 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#651]) -> [SKIP][319] ([Intel XE#2351] / [Intel XE#2890]) +15 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#658]) -> [SKIP][321] ([Intel XE#2351] / [Intel XE#2890])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#653]) -> [SKIP][323] ([Intel XE#2890]) +28 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [TIMEOUT][324] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][325] ([Intel XE#653])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#653]) -> [SKIP][327] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][329] ([Intel XE#653]) +8 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2890]) -> [SKIP][331] ([Intel XE#653]) +27 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2890]) -> [SKIP][333] ([Intel XE#2925])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#346]) -> [SKIP][335] ([Intel XE#2890])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2423] / [i915#2575]) -> [SKIP][337] ([Intel XE#356])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][338] ([Intel XE#1035]) -> [INCOMPLETE][339] ([Intel XE#1035] / [Intel XE#1195])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2423] / [i915#2575]) -> [SKIP][341] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2938]) -> [SKIP][343] ([Intel XE#2890])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2890]) -> [SKIP][345] ([Intel XE#870]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#870]) -> [SKIP][347] ([Intel XE#2890])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#1129]) -> [SKIP][349] ([Intel XE#2890])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1489]) -> [SKIP][351] ([Intel XE#2890]) +9 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2890]) -> [SKIP][353] ([Intel XE#1489]) +13 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1122]) -> [SKIP][355] ([Intel XE#2890])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][357] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][359] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2890]) -> [SKIP][361] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][363] ([Intel XE#2890]) +10 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_psr@pr-basic.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][365] ([Intel XE#2351])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2351]) -> [SKIP][367] ([Intel XE#2850] / [Intel XE#929])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][368] -> [SKIP][369] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1127]) -> [SKIP][371] ([Intel XE#2423] / [i915#2575])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2423] / [i915#2575]) -> [SKIP][373] ([Intel XE#1127])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2423] / [i915#2575]) -> [SKIP][375] ([Intel XE#362])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][376] ([Intel XE#2509]) -> [SKIP][377] ([Intel XE#2426])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2423] / [i915#2575]) -> [SKIP][379] ([Intel XE#1500])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2423] / [i915#2575]) -> [SKIP][381] ([Intel XE#2168])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_vrr@cmrr.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [SKIP][383] ([Intel XE#455]) +7 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_vrr@flipline.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#2423] / [i915#2575]) -> [SKIP][385] ([Intel XE#756])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][387] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][389] ([Intel XE#1130])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#1130]) -> [SKIP][391] ([Intel XE#1123]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#944]) -> [SKIP][393] ([Intel XE#1130]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#1130]) -> [FAIL][395] ([Intel XE#2667])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2905]) -> [SKIP][397] ([Intel XE#1130]) +9 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][398] ([Intel XE#1600]) -> [SKIP][399] ([Intel XE#1130])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#1130]) -> [TIMEOUT][401] ([Intel XE#1473])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#1130]) -> [FAIL][403] ([Intel XE#1600])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         [TIMEOUT][404] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#2981]) -> [SKIP][405] ([Intel XE#1392])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1130]) -> [SKIP][407] ([Intel XE#288]) +29 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#288]) -> [SKIP][409] ([Intel XE#1130]) +25 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1130]) -> [SKIP][411] ([Intel XE#2905]) +13 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-dg2-set2:     [DMESG-WARN][412] ([Intel XE#3343]) -> [SKIP][413] ([Intel XE#1130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#560]) -> [SKIP][415] ([Intel XE#1130])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_media_fill@media-fill.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#2541]) -> [SKIP][417] ([Intel XE#1130]) +8 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1130]) -> [SKIP][419] ([Intel XE#2541]) +5 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#1130]) -> [SKIP][421] ([Intel XE#2838] / [Intel XE#979])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][423] ([Intel XE#1130])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#1130]) -> [SKIP][425] ([Intel XE#2284] / [Intel XE#366])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#1130]) -> [ABORT][427] ([Intel XE#1794])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#1130]) -> [SKIP][429] ([Intel XE#944]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#3342]) -> [SKIP][431] ([Intel XE#1130])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#1130]) -> [DMESG-WARN][433] ([Intel XE#2919])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_wedged@basic-wedged.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1130]) -> [ABORT][435] ([Intel XE#3075] / [Intel XE#3084])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2981
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8100 -> IGT_8101
  * Linux: xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25 -> xe-pw-139121v4

  IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25: 5521311ecd7ffbb0adf016dbf83bd0165fc94d25
  xe-pw-139121v4: 139121v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/index.html

--===============5192064593046056159==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: PMU interface for Xe (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139121/">https://patchwork.freedesktop.org/series/139121/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25_full -&gt; xe-pw-139121v4_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-139121v4_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139121v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139121v4_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139121v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +117 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-5/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-5/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-8/igt@kms_pm_backlight@fade-with-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-1073741824:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_vm@large-userptr-split-binds-1073741824.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_flip@busy-flip.html">PASS</a> +92 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-4/igt@kms_vblank@query-forked-hang.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-5/igt@kms_vblank@query-forked-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@testdisplay.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> +183 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-6/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-3/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-5/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-lnl-2/igt@xe_pm_residency@idle-residency-on-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564">Intel XE#2564</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2981">Intel XE#2981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v4/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8100 -&gt; IGT_8101</li>
<li>Linux: xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25 -&gt; xe-pw-139121v4</li>
</ul>
<p>IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25: 5521311ecd7ffbb0adf016dbf83bd0165fc94d25<br />
  xe-pw-139121v4: 139121v4</p>

</body>
</html>

--===============5192064593046056159==--
