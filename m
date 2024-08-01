Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59977C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 02:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00C410E20B;
	Thu,  1 Aug 2024 02:21:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAA410E20B;
 Thu,  1 Aug 2024 02:21:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6048734058452849570=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Faster_devcoredump_and_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 02:21:57 -0000
Message-ID: <172247891735.485970.6238985299393185746@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731213221.2523989-1-matthew.brost@intel.com>
In-Reply-To: <20240731213221.2523989-1-matthew.brost@intel.com>
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

--===============6048734058452849570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Faster devcoredump and fixes
URL   : https://patchwork.freedesktop.org/series/136770/
State : failure

== Summary ==

CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_full -> xe-pw-136770v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136770v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136770v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136770v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-x:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-x.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [PASS][2] -> [SKIP][3] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-lnl:          [PASS][4] -> [SKIP][5] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_vrr@flip-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-lnl:          [SKIP][10] ([Intel XE#2423]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][15] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          [SKIP][16] ([Intel XE#1439]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  
Known issues
------------

  Here are the changes found in xe-pw-136770v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1201] / [Intel XE#2423])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@core_getstats.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@core_getstats.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1885])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@core_hotunplug@hotunplug-rescan.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
    - shard-lnl:          [PASS][24] -> [SKIP][25] ([Intel XE#1885])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#1201] / [Intel XE#2134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@fbdev@eof.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@fbdev@eof.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#660])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#660])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][30] ([Intel XE#911])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][31] ([Intel XE#1033]) +2 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#1426]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][36] ([Intel XE#1204]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#316])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#2191])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#2191])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1399]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#787]) +53 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#787]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#306])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#373]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#1204])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#616])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][62] ([Intel XE#1551])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][63] ([Intel XE#877]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#599])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#702])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#1201] / [i915#2575]) +28 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([i915#2575]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1195] / [Intel XE#2049])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#1201] / [Intel XE#2351]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1397])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][79] ([Intel XE#324]) +2 other tests dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         NOTRUN -> [FAIL][83] ([Intel XE#1874]) +7 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#656]) +17 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656]) +14 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#1201]) +18 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#651]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#653]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-lnl:          [PASS][94] -> [SKIP][95] ([Intel XE#2351]) +33 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_getfb@getfb-handle-protection:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +18 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_getfb@getfb-handle-protection.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_getfb@getfb-handle-protection.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1470])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch:
    - shard-lnl:          [PASS][100] -> [SKIP][101] ([Intel XE#2423]) +46 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_hdr@bpc-switch.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][102] ([Intel XE#1035] / [Intel XE#1195])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][103] ([Intel XE#2078]) +1 other test warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][104] -> [DMESG-WARN][105] ([Intel XE#324]) +1 other test dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][106] -> [DMESG-FAIL][107] ([Intel XE#324]) +1 other test dmesg-fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][108] -> [FAIL][109] ([Intel XE#361])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#498]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2318]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2318]) +12 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [PASS][122] -> [SKIP][123] ([Intel XE#870])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@kms_pm_backlight@basic-brightness.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#870])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#836])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1439])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201]) +28 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2351]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1149] / [Intel XE#1201])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1127])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1127] / [Intel XE#1201])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#771] / [Intel XE#899])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][138] -> [FAIL][139] ([Intel XE#899])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2423]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_vblank@query-forked.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][141] ([Intel XE#2019]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#1050])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1447])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#1447])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][146] -> [INCOMPLETE][147] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1130]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][149] -> [TIMEOUT][150] ([Intel XE#1473])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#688]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][153] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-dg2-set2:     [PASS][155] -> [SKIP][156] ([Intel XE#1130] / [Intel XE#1201]) +78 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1201] / [Intel XE#688])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#1130]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - shard-adlp:         [PASS][160] -> [SKIP][161] ([Intel XE#1201]) +98 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1392]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [PASS][164] -> [FAIL][165] ([Intel XE#2125])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - shard-lnl:          [PASS][168] -> [SKIP][169] ([Intel XE#1130]) +85 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@xe_exec_threads@threads-userptr-rebind-err.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_exec_threads@threads-userptr-rebind-err.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][170] -> [SKIP][171] ([Intel XE#1192])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [FAIL][174] ([Intel XE#1173]) +1 other test fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][175] -> [ABORT][176] ([Intel XE#1358] / [Intel XE#1794])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_vm@large-misaligned-binds-1073741824:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1130] / [Intel XE#1201]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_vm@large-misaligned-binds-1073741824.html

  * igt@xe_vm@munmap-style-unbind-userptr-one-partial:
    - shard-adlp:         [PASS][179] -> [SKIP][180] ([Intel XE#1130] / [Intel XE#1201]) +30 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@core_hotunplug@hotreplug.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@core_hotunplug@hotreplug.html
    - shard-lnl:          [SKIP][183] ([Intel XE#1885]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@core_hotunplug@hotreplug.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-lnl:          [SKIP][185] -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][187] -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
    - shard-lnl:          [FAIL][189] -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@core_setmaster@master-drop-set-user.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@core_setmaster@master-drop-set-user.html
    - shard-adlp:         [FAIL][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@core_setmaster@master-drop-set-user.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#2134]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@fbdev@nullptr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@fbdev@nullptr.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#2423]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_3d.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_3d.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [FAIL][197] ([Intel XE#1701]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][199] ([Intel XE#1426]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][201] ([Intel XE#1659]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][205] ([Intel XE#1204]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][207] ([Intel XE#324]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][210] +32 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][211] ([Intel XE#886]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][213] ([Intel XE#324]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201]) -> [PASS][216] +29 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][217] ([Intel XE#2351]) -> [PASS][218] +40 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - shard-lnl:          [SKIP][219] ([Intel XE#2423]) -> [PASS][220] +60 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_getfb@getfb2-handle-not-fb.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [i915#2575]) -> [PASS][222] +36 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_lease@invalid-create-leases.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_lease@invalid-create-leases.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-adlp:         [SKIP][223] ([Intel XE#1201]) -> [PASS][224] +149 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_lease@setcrtc-implicit-plane.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][225] ([Intel XE#324]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][227] ([Intel XE#324]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-adlp:         [SKIP][229] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-adlp:         [FAIL][231] ([Intel XE#1874]) -> [PASS][232] +3 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_lowres@tiling-x.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-adlp:         [DMESG-FAIL][233] ([Intel XE#2226]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_pm_dc@dc5-dpms.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [SKIP][235] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [FAIL][237] ([Intel XE#2028]) -> [PASS][238] +2 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@psr2-suspend.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_psr@psr2-suspend.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-rebind:
    - shard-adlp:         [DMESG-WARN][239] ([Intel XE#2226]) -> [PASS][240] +12 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-basic:
    - shard-adlp:         [DMESG-WARN][241] ([Intel XE#2226] / [Intel XE#358]) -> [PASS][242] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_exec_threads@threads-hang-basic.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - shard-lnl:          [SKIP][243] ([Intel XE#1130]) -> [PASS][244] +114 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-dg2-set2:     [FAIL][245] ([Intel XE#2203]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-lnl:          [FAIL][247] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][249] ([Intel XE#2019]) -> [PASS][250] +1 other test pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_pm@s4-basic-exec.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][251] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-adlp:         [SKIP][253] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][254] +41 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_vm@large-misaligned-binds-2147483648.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-2147483648.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-all:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][256] +113 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_vm@munmap-style-unbind-userptr-many-all.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_vm@munmap-style-unbind-userptr-many-all.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#1885]) -> [ABORT][258] ([Intel XE#2421])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
    - shard-lnl:          [SKIP][259] ([Intel XE#1885]) -> [ABORT][260] ([Intel XE#2421])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@core_hotunplug@unbind-rebind.html
    - shard-adlp:         [SKIP][261] ([Intel XE#1201]) -> [ABORT][262] ([Intel XE#2421])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@core_hotunplug@unbind-rebind.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@core_hotunplug@unbind-rebind.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          [SKIP][263] ([Intel XE#2351]) -> [SKIP][264] ([Intel XE#1125])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@intel_hwmon@hwmon-read.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@intel_hwmon@hwmon-read.html
    - shard-adlp:         [SKIP][265] ([Intel XE#1201]) -> [SKIP][266] ([Intel XE#1125] / [Intel XE#1201])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@intel_hwmon@hwmon-read.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_3d:
    - shard-lnl:          [SKIP][267] ([Intel XE#2423]) -> [SKIP][268] ([Intel XE#1465])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_3d.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_3d.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [SKIP][269] ([Intel XE#1201]) -> [DMESG-WARN][270] ([Intel XE#1033])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#873]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#873])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][273] ([Intel XE#2423]) -> [SKIP][274] ([Intel XE#664])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_async_flips@test-cursor.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#316])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-lnl:          [SKIP][277] ([Intel XE#2351]) -> [SKIP][278] ([Intel XE#1407]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-adlp:         [SKIP][279] ([Intel XE#1201]) -> [SKIP][280] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][281] ([Intel XE#2351]) -> [FAIL][282] ([Intel XE#1659])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [DMESG-WARN][283] ([Intel XE#1725]) -> [SKIP][284] ([Intel XE#2351])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-adlp:         [SKIP][285] ([Intel XE#1201]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#316])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#316]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][292] ([Intel XE#316])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][293] ([Intel XE#1204]) -> [SKIP][294] ([Intel XE#1201])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][295] ([Intel XE#1231]) -> [SKIP][296] ([Intel XE#1201])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][297] ([Intel XE#324]) -> [FAIL][298] ([Intel XE#1231])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201]) -> [SKIP][300] ([Intel XE#1124])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][302] ([Intel XE#610])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201]) -> [SKIP][304] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][305] ([Intel XE#1201]) -> [FAIL][306] ([Intel XE#1231]) +2 other tests fail
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][307] ([Intel XE#1201]) -> [FAIL][308] ([Intel XE#1874]) +4 other tests fail
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][309] ([Intel XE#1242]) -> [DMESG-FAIL][310] ([Intel XE#324])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][312] ([Intel XE#1201]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][313] ([Intel XE#1124]) -> [SKIP][314] ([Intel XE#2351]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-adlp:         [SKIP][315] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][316] ([Intel XE#1201]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1124]) -> [SKIP][318] ([Intel XE#1201])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][320] ([Intel XE#1124]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][322] ([Intel XE#619])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1124]) -> [SKIP][324] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][325] ([Intel XE#2351]) -> [SKIP][326] ([Intel XE#1124]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         [SKIP][327] ([Intel XE#1201]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          [SKIP][329] ([Intel XE#2423]) -> [SKIP][330] ([Intel XE#2191])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2191]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#2191])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][334] ([Intel XE#1201] / [i915#2575])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          [SKIP][335] ([Intel XE#2191]) -> [SKIP][336] ([Intel XE#2423])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-adlp:         [SKIP][337] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][338] ([Intel XE#1201])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         [SKIP][339] ([Intel XE#1201]) -> [SKIP][340] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][342] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          [SKIP][343] ([Intel XE#367]) -> [SKIP][344] ([Intel XE#2423]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][345] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][346] ([Intel XE#1201]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][348] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#367]) -> [SKIP][350] ([Intel XE#1201] / [Intel XE#367])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [i915#2575]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          [SKIP][353] ([Intel XE#2423]) -> [SKIP][354] ([Intel XE#1512])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][356] ([Intel XE#367]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1201]) -> [SKIP][358] ([Intel XE#455] / [Intel XE#787])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-adlp:         [SKIP][359] ([Intel XE#1201]) -> [SKIP][360] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][363] ([Intel XE#2351]) -> [SKIP][364] ([Intel XE#1399]) +11 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][367] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][368] ([Intel XE#1201]) +6 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][370] ([Intel XE#1201]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][372] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][374] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#787]) -> [SKIP][376] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1201]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][381] ([Intel XE#1201]) -> [SKIP][382] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][384] ([Intel XE#1201])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1252]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#1252])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][388] ([Intel XE#787]) +48 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          [SKIP][389] ([Intel XE#1399]) -> [SKIP][390] ([Intel XE#2351]) +7 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][392] ([Intel XE#1152]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         [SKIP][393] ([Intel XE#1201]) -> [SKIP][394] ([Intel XE#1201] / [Intel XE#306])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1201] / [i915#2575]) -> [SKIP][396] ([Intel XE#1201] / [Intel XE#306])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#306]) -> [SKIP][398] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          [SKIP][399] ([Intel XE#373]) -> [SKIP][400] ([Intel XE#2423]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-adlp:         [SKIP][401] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][402] ([Intel XE#1201]) +3 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][404] ([i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#373]) -> [SKIP][406] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         [SKIP][407] ([Intel XE#1201]) -> [SKIP][408] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][410] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1201] / [i915#2575]) -> [SKIP][412] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#373]) -> [SKIP][414] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][416] ([Intel XE#1201] / [i915#2575]) +4 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_chamelium_frames@vga-frame-dump.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          [SKIP][417] ([Intel XE#2423]) -> [SKIP][418] ([Intel XE#373]) +7 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][420] ([Intel XE#373]) +5 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [i915#2575]) -> [SKIP][422] ([Intel XE#373])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][426] ([Intel XE#1201] / [Intel XE#307])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          [SKIP][427] ([Intel XE#2423]) -> [SKIP][428] ([Intel XE#307])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-adlp:         [SKIP][429] ([Intel XE#1201]) -> [SKIP][430] ([Intel XE#1201] / [Intel XE#307])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [FAIL][432] ([Intel XE#1204])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [i915#2575]) -> [SKIP][434] ([Intel XE#455])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#308]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#308])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          [SKIP][437] ([Intel XE#2423]) -> [SKIP][438] ([Intel XE#1424]) +5 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][440] ([Intel XE#308])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         [SKIP][441] ([Intel XE#1201]) -> [SKIP][442] ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_cursor_crc@cursor-random-32x32.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][443] ([Intel XE#2423]) -> [SKIP][444] ([Intel XE#1413])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x170.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-adlp:         [SKIP][445] ([Intel XE#1201]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#308])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201] / [i915#2575]) -> [SKIP][448] ([Intel XE#1201] / [Intel XE#308])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x170.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201] / [i915#2575]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201] / [i915#2575]) -> [SKIP][452] ([i915#2575])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_cursor_crc@cursor-size-change.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][454] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-lnl:          [SKIP][455] ([Intel XE#1424]) -> [SKIP][456] ([Intel XE#2423]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [DMESG-FAIL][458] ([Intel XE#1551])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          [SKIP][459] ([Intel XE#2423]) -> [SKIP][460] ([Intel XE#309]) +5 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][461] ([Intel XE#309]) -> [SKIP][462] ([Intel XE#2423]) +2 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          [SKIP][463] ([Intel XE#2423]) -> [SKIP][464] ([Intel XE#323]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1201] / [i915#2575]) -> [SKIP][466] ([Intel XE#1201] / [Intel XE#323])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         [SKIP][467] ([Intel XE#1201]) -> [SKIP][468] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         [SKIP][469] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][470] ([Intel XE#1201]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         [SKIP][471] ([Intel XE#1201]) -> [SKIP][472] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#323]) -> [SKIP][474] ([Intel XE#1201] / [Intel XE#323])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201] / [i915#3804]) -> [SKIP][478] ([i915#3804])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][480] ([Intel XE#1201]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-lnl:          [SKIP][481] ([Intel XE#599]) -> [SKIP][482] ([Intel XE#2351])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][484] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1201]) -> [SKIP][486] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-lnl:          [SKIP][487] ([Intel XE#2351]) -> [SKIP][488] ([Intel XE#599]) +2 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         [SKIP][489] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][490] ([Intel XE#1201])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][492] ([Intel XE#1201])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1201] / [i915#2575]) -> [SKIP][494] ([Intel XE#1137])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          [SKIP][495] ([Intel XE#2423]) -> [SKIP][496] ([Intel XE#1137])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_feature_discovery@dp-mst.html
    - shard-adlp:         [SKIP][497] ([Intel XE#1201]) -> [SKIP][498] ([Intel XE#1137] / [Intel XE#1201])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         [SKIP][499] ([Intel XE#1201]) -> [SKIP][500] ([Intel XE#1135] / [Intel XE#1201])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_feature_discovery@psr1.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201] / [i915#2575]) -> [SKIP][502] ([Intel XE#1135] / [Intel XE#1201])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         [SKIP][503] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][504] ([Intel XE#1201]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          [SKIP][505] ([Intel XE#1421]) -> [SKIP][506] ([Intel XE#2423]) +3 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         [SKIP][507] ([Intel XE#1201]) -> [SKIP][508] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          [SKIP][509] ([Intel XE#2423]) -> [SKIP][510] ([Intel XE#1421]) +4 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][511] ([Intel XE#1551]) -> [INCOMPLETE][512] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          [SKIP][513] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][514] ([Intel XE#2351]) +3 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][516] ([Intel XE#455]) +4 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          [SKIP][517] ([Intel XE#2351]) -> [SKIP][518] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#455]) -> [SKIP][520] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#1201]) -> [SKIP][522] ([Intel XE#455])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][523] ([Intel XE#2351]) -> [SKIP][524] ([Intel XE#1397] / [Intel XE#1745])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][525] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][526] ([Intel XE#2351])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-adlp:         [SKIP][527] ([Intel XE#1201]) -> [DMESG-FAIL][528] ([Intel XE#324])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          [SKIP][529] ([Intel XE#2423]) -> [SKIP][530] ([Intel XE#352])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][532] ([Intel XE#651]) +13 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][534] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][535] ([Intel XE#1201]) -> [SKIP][536] ([Intel XE#1201] / [Intel XE#656]) +37 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][538] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
    - shard-lnl:          [SKIP][539] ([Intel XE#651]) -> [SKIP][540] ([Intel XE#2351]) +5 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1201]) -> [SKIP][542] ([Intel XE#651]) +3 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#651]) -> [SKIP][544] ([Intel XE#1201] / [Intel XE#651]) +13 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][545] ([Intel XE#1201]) -> [FAIL][546] ([Intel XE#1861]) +2 other tests fail
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][547] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][548] ([Intel XE#1201]) +18 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][549] ([Intel XE#656]) -> [SKIP][550] ([Intel XE#2351]) +20 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][552] ([Intel XE#651]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][553] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][554] ([Intel XE#1201]) +4 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][555] ([Intel XE#1201]) -> [SKIP][556] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][558] ([Intel XE#1201]) +8 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#651]) -> [SKIP][560] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         [SKIP][561] ([Intel XE#1201]) -> [SKIP][562] ([Intel XE#1151] / [Intel XE#1201])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1201]) -> [SKIP][564] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
    - shard-lnl:          [SKIP][565] ([Intel XE#2351]) -> [SKIP][566] ([Intel XE#651]) +10 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#658]) -> [SKIP][568] ([Intel XE#1201] / [Intel XE#658])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#653]) -> [SKIP][570] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][572] ([Intel XE#1201]) +8 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][574] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1201]) -> [SKIP][576] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][578] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#1158]) -> [SKIP][580] ([Intel XE#1158] / [Intel XE#1201])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-adlp:         [SKIP][581] ([Intel XE#1201]) -> [SKIP][582] ([Intel XE#1158] / [Intel XE#1201])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][583] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][584] ([Intel XE#1201]) +7 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#653]) -> [SKIP][586] ([Intel XE#1201] / [Intel XE#2351])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][587] ([Intel XE#1201]) -> [SKIP][588] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][590] ([Intel XE#653]) +12 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][591] ([Intel XE#2351]) -> [SKIP][592] ([Intel XE#656]) +31 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1201]) -> [SKIP][594] ([Intel XE#653]) +2 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#653]) -> [SKIP][596] ([Intel XE#1201])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-lnl:          [SKIP][597] ([Intel XE#2423]) -> [SKIP][598] ([Intel XE#605])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html
    - shard-adlp:         [SKIP][599] ([Intel XE#1201]) -> [SKIP][600] ([Intel XE#1201] / [Intel XE#1341])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_getfb@getfb-reject-ccs.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1201] / [i915#2575]) -> [SKIP][602] ([Intel XE#1201] / [Intel XE#605])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-adlp:         [SKIP][603] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][604] ([Intel XE#1201]) +7 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_hdr@bpc-switch.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][605] ([Intel XE#599]) -> [SKIP][606] ([Intel XE#2423])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][607] ([Intel XE#324]) -> [DMESG-WARN][608] ([Intel XE#324])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#1201] / [i915#2575]) -> [SKIP][610] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_plane@plane-position-hole-dpms.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][611] ([Intel XE#2423]) -> [SKIP][612] ([Intel XE#599]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][614] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][616] ([Intel XE#498]) +2 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1201] / [i915#2575]) -> [SKIP][618] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-lnl:          [SKIP][619] ([Intel XE#2423]) -> [SKIP][620] ([Intel XE#498])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-adlp:         [SKIP][621] ([Intel XE#1201]) -> [SKIP][622] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#1201] / [i915#2575]) -> [SKIP][624] ([Intel XE#2318] / [Intel XE#455])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][626] ([Intel XE#2318] / [Intel XE#455])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
    - shard-adlp:         [SKIP][627] ([Intel XE#1201]) -> [SKIP][628] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][630] ([i915#2575]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          [SKIP][631] ([Intel XE#2318]) -> [SKIP][632] ([Intel XE#2423])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-adlp:         [SKIP][633] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][634] ([Intel XE#1201])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][636] ([Intel XE#1201] / [i915#2575])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][637] ([Intel XE#2423]) -> [SKIP][638] ([Intel XE#2318]) +2 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][640] ([Intel XE#870])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1201]) -> [SKIP][642] ([Intel XE#1129])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          [SKIP][643] ([Intel XE#2351]) -> [FAIL][644] ([Intel XE#718])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
    - shard-adlp:         [SKIP][645] ([Intel XE#1201]) -> [SKIP][646] ([Intel XE#1129] / [Intel XE#1201])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][648] ([Intel XE#908])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         [SKIP][649] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][650] ([Intel XE#1201])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][652] ([Intel XE#1201]) +3 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#1201]) -> [SKIP][654] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#1201]) -> [SKIP][656] ([Intel XE#1489])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1489]) -> [SKIP][658] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][660] ([Intel XE#1201] / [Intel XE#2351])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][662] ([Intel XE#1489])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1201]) -> [SKIP][664] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          [SKIP][665] ([Intel XE#2351]) -> [SKIP][666] ([Intel XE#1128]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_psr2_su@page_flip-nv12.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#1122]) -> [SKIP][668] ([Intel XE#1122] / [Intel XE#1201])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         [SKIP][669] ([Intel XE#1201]) -> [SKIP][670] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#929]) -> [SKIP][672] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][674] ([Intel XE#2351]) +1 other test skip
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][676] ([Intel XE#1201]) +5 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][678] ([Intel XE#1201] / [Intel XE#2351])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-blt.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][680] ([Intel XE#1201] / [Intel XE#929])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-blt.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          [SKIP][681] ([Intel XE#2351]) -> [SKIP][682] ([Intel XE#1406])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_psr@pr-no-drrs.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          [SKIP][683] ([Intel XE#1406]) -> [SKIP][684] ([Intel XE#2351])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@pr-sprite-plane-move.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         [SKIP][685] ([Intel XE#1201]) -> [SKIP][686] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_psr@psr-cursor-plane-onoff.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][688] ([Intel XE#929]) +8 other tests skip
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_psr@psr-dpms.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#1201]) -> [SKIP][690] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         [SKIP][691] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][692] ([Intel XE#1201]) +5 other tests skip
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         [SKIP][693] ([Intel XE#1201]) -> [SKIP][694] ([Intel XE#1149] / [Intel XE#1201])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][696] ([Intel XE#1149] / [Intel XE#1201])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         [SKIP][697] ([Intel XE#1201]) -> [SKIP][698] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#1201] / [i915#2575]) -> [SKIP][700] ([Intel XE#327])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          [SKIP][701] ([Intel XE#2423]) -> [SKIP][702] ([Intel XE#1437]) +1 other test skip
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_rotation_crc@bad-pixel-format.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][703] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][704] ([i915#2575])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-lnl:          [SKIP][705] ([Intel XE#1127]) -> [SKIP][706] ([Intel XE#2423])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][708] ([Intel XE#327])
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][710] ([Intel XE#1201] / [Intel XE#327])
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][711] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][712] ([Intel XE#1201])
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][714] ([i915#2575])
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-lnl:          [SKIP][715] ([Intel XE#1437]) -> [SKIP][716] ([Intel XE#2423])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][717] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][718] ([Intel XE#1201] / [i915#2575])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][720] ([Intel XE#1500])
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         [SKIP][721] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][722] ([Intel XE#1201])
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_vrr@cmrr.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][724] ([i915#2575])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_vrr@cmrr.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][725] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][726] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_vrr@flip-dpms.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          [SKIP][727] ([Intel XE#2423]) -> [SKIP][728] ([Intel XE#1499] / [Intel XE#599])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         [SKIP][729] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][730] ([Intel XE#1201])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_writeback@writeback-check-output.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_writeback@writeback-check-output.html
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][732] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_writeback@writeback-check-output.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_writeback@writeback-check-output.html
    - shard-lnl:          [SKIP][733] ([Intel XE#756]) -> [SKIP][734] ([Intel XE#2423])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_writeback@writeback-check-output.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][735] ([Intel XE#756]) -> [SKIP][736] ([Intel XE#1201] / [Intel XE#756])
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         [SKIP][737] ([Intel XE#1201]) -> [SKIP][738] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_ccs@block-copy-compressed-inc-dimension.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         [SKIP][739] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][740] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_ccs@block-multicopy-compressed.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][741] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][742] ([Intel XE#1126]) +1 other test skip
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          [SKIP][743] ([Intel XE#1130]) -> [SKIP][744] ([Intel XE#1062])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_create@create-big-vram.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@xe_create@create-big-vram.html
    - shard-adlp:         [SKIP][745] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][746] ([Intel XE#1062] / [Intel XE#1201])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_create@create-big-vram.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][747] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [TIMEOUT][748] ([Intel XE#1473] / [Intel XE#402])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         [SKIP][749] ([Intel XE#1201]) -> [SKIP][750] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_evict@evict-beng-small-cm.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [FAIL][751] ([Intel XE#1000]) -> [INCOMPLETE][752] ([Intel XE#1195] / [Intel XE#1473])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         [SKIP][753] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][754] ([Intel XE#1201] / [Intel XE#261])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         [SKIP][755] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][756] ([Intel XE#1201]) +3 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][758] ([Intel XE#1130]) +2 other tests skip
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         [SKIP][759] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) -> [SKIP][760] ([Intel XE#1201]) +1 other test skip
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_evict@evict-small.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_evict@evict-small.html

  * igt@xe_evict@evict-small-cm:
    - shard-lnl:          [SKIP][761] ([Intel XE#1130]) -> [SKIP][762] ([Intel XE#688]) +5 other tests skip
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@xe_evict@evict-small-cm.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          [SKIP][763] ([Intel XE#688]) -> [SKIP][764] ([Intel XE#1130]) +6 other tests skip
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
    - shard-adlp:         [SKIP][765] ([Intel XE#1201] / [Intel XE#688]) -> [SKIP][766] ([Intel XE#1201])
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         [SKIP][767] ([Intel XE#1201]) -> [SKIP][768] ([Intel XE#1201] / [Intel XE#688])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         [SKIP][769] ([Intel XE#1201]) -> [SKIP][770] ([Intel XE#1201] / [Intel XE#1392]) +8 other tests skip
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         [SKIP][771] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][772] ([Intel XE#1201]) +4 other tests skip
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          [SKIP][773] ([Intel XE#1392]) -> [SKIP][774] ([Intel XE#1130]) +4 other tests skip
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          [SKIP][775] ([Intel XE#1130]) -> [SKIP][776] ([Intel XE#1392]) +8 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     [SKIP][777] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][778] ([Intel XE#1130] / [Intel XE#1201]) +6 other tests skip
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_exec_fault_mode@many-basic-prefetch.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][779] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][780] ([Intel XE#1130])
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][781] ([Intel XE#288]) -> [SKIP][782] ([Intel XE#1130])
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         [SKIP][783] ([Intel XE#1201]) -> [SKIP][784] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         [SKIP][785] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][786] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][787] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][788] ([Intel XE#288]) +11 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-imm.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][789] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][790] ([Intel XE#288]) +2 other tests skip
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][791] ([Intel XE#288]) -> [SKIP][792] ([Intel XE#1130] / [Intel XE#1201])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][793] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][794] ([Intel XE#1201]) +7 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - shard-adlp:         [SKIP][795] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][796] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][797] ([Intel XE#288]) -> [SKIP][798] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][799] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][800] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][801] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][802] ([Intel XE#1201] / [Intel XE#2360])
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
    - shard-adlp:         [SKIP][803] ([Intel XE#1201]) -> [SKIP][804] ([Intel XE#1201] / [Intel XE#2360])
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-adlp:         [INCOMPLETE][805] ([Intel XE#1169] / [Intel XE#1195]) -> [SKIP][806] ([Intel XE#1201])
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - shard-adlp:         [DMESG-WARN][807] ([Intel XE#2226]) -> [SKIP][808] ([Intel XE#1201])
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][809] ([Intel XE#255]) -> [SKIP][810] ([Intel XE#1201] / [Intel XE#255])
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][811] ([Intel XE#1999]) -> [SKIP][812] ([Intel XE#1192] / [Intel XE#1201])
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@vram:
    - shard-lnl:          [SKIP][813] ([Intel XE#1416]) -> [SKIP][814] ([Intel XE#1130])
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@xe_mmap@vram.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_mmap@vram.html
    - shard-adlp:         [SKIP][815] ([Intel XE#1008] / [Intel XE#1201]) -> [SKIP][816] ([Intel XE#1130] / [Intel XE#1201])
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_mmap@vram.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][817] ([Intel XE#378]) -> [SKIP][818] ([Intel XE#1201] / [Intel XE#378])
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_module_load@force-load.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][819] -> [FAIL][820] ([Intel XE#2136])
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_module_load@reload.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][821] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][822] ([Intel XE#2419]) +3 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][823] ([Intel XE#2419]) -> [SKIP][824] ([Intel XE#1201] / [Intel XE#2419]) +4 other tests skip
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][825] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][826] ([Intel XE#1130] / [Intel XE#1201])
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
    - shard-adlp:         [SKIP][827] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][828] ([Intel XE#1130] / [Intel XE#1201])
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][829] ([Intel XE#1130]) -> [SKIP][830] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@xe_pm@d3cold-basic.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@xe_pm@d3cold-basic.html
    - shard-adlp:         [SKIP][831] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][832] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_pm@d3cold-basic.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][833] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][834] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][835] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][836] ([Intel XE#1130] / [Intel XE#1201])
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
    - shard-lnl:          [SKIP][837] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][838] ([Intel XE#1130])
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@d3cold-mmap-vram.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-vram.html
    - shard-adlp:         [SKIP][839] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][840] ([Intel XE#1130] / [Intel XE#1201])
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_pm@d3cold-mmap-vram.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][841] ([Intel XE#2284]) -> [SKIP][842] ([Intel XE#1201] / [Intel XE#2284])
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          [SKIP][843] ([Intel XE#1130]) -> [SKIP][844] ([Intel XE#584])
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_pm@s3-basic.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][845] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][846] ([Intel XE#579])
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][847] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][848] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          [SKIP][849] ([Intel XE#944]) -> [SKIP][850] ([Intel XE#1130]) +3 other tests skip
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_query@multigpu-query-cs-cycles.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][851] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][852] ([Intel XE#1201] / [Intel XE#944]) +4 other tests skip
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
    - shard-lnl:          [SKIP][853] ([Intel XE#1130]) -> [SKIP][854] ([Intel XE#944]) +3 other tests skip
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_query@multigpu-query-engines.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_query@multigpu-query-engines.html
    - shard-adlp:         [SKIP][855] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][856] ([Intel XE#1201] / [Intel XE#944]) +4 other tests skip
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_query@multigpu-query-engines.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][857] ([Intel XE#944]) -> [SKIP][858] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][859] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][860] ([Intel XE#944])
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         [SKIP][861] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][862] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_query@multigpu-query-invalid-query.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_vm@large-userptr-binds-8388608:
    - shard-adlp:         [DMESG-WARN][863] ([Intel XE#2226]) -> [SKIP][864] ([Intel XE#1130] / [Intel XE#1201])
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_vm@large-userptr-binds-8388608.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_vm@large-userptr-binds-8388608.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_7948 -> IGT_7949
  * Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -> xe-pw-136770v1

  IGT_7948: 7948
  IGT_7949: 7949
  xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825
  xe-pw-136770v1: 136770v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/index.html

--===============6048734058452849570==
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
<tr><td><b>Series:</b></td><td>Faster devcoredump and fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136770/">https://patchwork.freedesktop.org/series/136770/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_full -&gt; xe-pw-136770v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136770v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136770v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136770v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-x.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_vrr@flip-basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136770v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@core_getstats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-protection:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_getfb@getfb-handle-protection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_getfb@getfb-handle-protection.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_vblank@query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@xe_evict@evict-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_exec_balancer@no-exec-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125">Intel XE#2125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@xe_exec_threads@threads-userptr-rebind-err.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_exec_threads@threads-userptr-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-1073741824:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_vm@large-misaligned-binds-1073741824.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-one-partial:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@core_hotunplug@hotreplug.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +40 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_getfb@getfb2-handle-not-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a> +60 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_lease@invalid-create-leases.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_lease@setcrtc-implicit-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_lease@setcrtc-implicit-plane.html">PASS</a> +149 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_lowres@tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_plane_lowres@tiling-x.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_pm_dc@dc5-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_psr@psr2-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_exec_threads@threads-hang-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">PASS</a> +114 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203">Intel XE#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@xe_pm@s2idle-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_vm@large-misaligned-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-2147483648.html">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_vm@munmap-style-unbind-userptr-many-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_vm@munmap-style-unbind-userptr-many-all.html">PASS</a> +113 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_cursor_crc@cursor-size-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-size-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-5/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-3/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_exec_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_exec_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-7/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-9/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-lnl-8/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-8/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-8388608:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_vm@large-userptr-binds-8388608.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136770v1/shard-adlp-4/igt@xe_vm@large-userptr-binds-8388608.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7948 -&gt; IGT_7949</li>
<li>Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -&gt; xe-pw-136770v1</li>
</ul>
<p>IGT_7948: 7948<br />
  IGT_7949: 7949<br />
  xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825<br />
  xe-pw-136770v1: 136770v1</p>

</body>
</html>

--===============6048734058452849570==--
