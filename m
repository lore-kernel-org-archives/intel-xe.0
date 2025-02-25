Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974BBC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 19:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E22510E7A7;
	Tue, 25 Feb 2025 19:15:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8016D10E7A7;
 Tue, 25 Feb 2025 19:15:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2725668269456510275=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/dp=3A_Fix_link_trainin?=
 =?utf-8?q?g_interrupted_by_HPD_pulse_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 19:15:11 -0000
Message-ID: <174051091151.2014377.16812098244691213273@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224193115.2058512-1-imre.deak@intel.com>
In-Reply-To: <20250224193115.2058512-1-imre.deak@intel.com>
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

--===============2725668269456510275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp: Fix link training interrupted by HPD pulse (rev3)
URL   : https://patchwork.freedesktop.org/series/145353/
State : failure

== Summary ==

CI Bug Log - changes from xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475_full -> xe-pw-145353v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145353v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145353v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145353v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#4330]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  
Known issues
------------

  Here are the changes found in xe-pw-145353v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#3767]) +15 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#3908]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#4330])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +134 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#4199])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4330]) +5 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][25] ([Intel XE#1727] / [Intel XE#3113])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#3124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#1178])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][28] ([Intel XE#4330])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-bmg:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#877]) +1 other test dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#308])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#309]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2291]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2316]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#310]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#4330]) +2 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][43] ([Intel XE#4330])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#886]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#2049] / [Intel XE#2597])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2293])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#656]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#651]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#616]) +3 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][61] ([Intel XE#2566] / [Intel XE#4212]) +1 other test dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2763]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#3309])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#3309])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1122])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2387])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2234] / [Intel XE#2850])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#899])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2905])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#1392]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#288]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2541] / [Intel XE#3573])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#1173])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2284] / [Intel XE#366])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2284])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [ABORT][79] ([Intel XE#4268])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#4330]) +5 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][82] ([Intel XE#4330]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][84] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#2191]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][88] ([Intel XE#4330]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-6.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][90] ([Intel XE#4330]) -> [PASS][91] +14 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#309]) -> [PASS][93] +4 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][94] ([Intel XE#2291]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][96] ([Intel XE#1340]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-adlp:         [DMESG-WARN][98] -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@kms_fbcon_fbt@fbc.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#702]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [SKIP][102] ([Intel XE#2316]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#310]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][106] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][107] +3 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][108] ([Intel XE#301]) -> [PASS][109] +4 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][110] ([Intel XE#2955]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][112] ([Intel XE#4330]) -> [PASS][113] +2 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][114] ([Intel XE#1874]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#656]) -> [PASS][117] +2 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [INCOMPLETE][118] ([Intel XE#3663] / [Intel XE#4016]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
    - shard-bmg:          [INCOMPLETE][120] ([Intel XE#4016]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][122] ([Intel XE#2953]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][124] ([Intel XE#1522]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1392]) -> [PASS][127] +4 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#3876]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [DMESG-WARN][130] ([Intel XE#4173]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][132] ([Intel XE#1999]) -> [PASS][133] +2 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [FAIL][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][136] ([Intel XE#4330]) -> [DMESG-FAIL][137] ([Intel XE#4330]) +1 other test dmesg-fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][139] ([Intel XE#787]) +8 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#787]) -> [SKIP][141] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][142] -> [FAIL][143] ([Intel XE#1178]) +1 other test fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][144] ([Intel XE#2291]) -> [DMESG-WARN][145] ([Intel XE#4330])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2-set2:     [DMESG-WARN][146] ([Intel XE#2955]) -> [DMESG-WARN][147] ([Intel XE#4330])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][148] ([Intel XE#2316]) -> [DMESG-WARN][149] ([Intel XE#4330])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#2955]) -> [INCOMPLETE][151] ([Intel XE#2049] / [Intel XE#2597])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [SKIP][153] ([Intel XE#2311]) +10 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][154] ([Intel XE#2311]) -> [SKIP][155] ([Intel XE#2312]) +8 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#651]) -> [SKIP][157] ([Intel XE#656]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][158] ([Intel XE#2312]) -> [SKIP][159] ([Intel XE#4141]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][160] ([Intel XE#4141]) -> [SKIP][161] ([Intel XE#2312]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#656]) -> [SKIP][163] ([Intel XE#651]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][164] ([Intel XE#2313]) -> [SKIP][165] ([Intel XE#2312]) +10 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][166] ([Intel XE#2312]) -> [SKIP][167] ([Intel XE#2313]) +8 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#653]) -> [SKIP][169] ([Intel XE#656]) +7 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#656]) -> [SKIP][171] ([Intel XE#653]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#1729]) -> [SKIP][173] ([Intel XE#362])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][174] ([Intel XE#2509]) -> [SKIP][175] ([Intel XE#2426])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][176], [PASS][177], [PASS][178], [SKIP][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201]) ([Intel XE#378]) -> ([PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [DMESG-WARN][214], [PASS][215], [SKIP][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227]) ([Intel XE#378] / [Intel XE#4173])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-9/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-9/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-9/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-4/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-4/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-8/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1061]) -> [FAIL][229] ([Intel XE#1173])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@xe_peer2peer@read.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@xe_peer2peer@read.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4016
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475 -> xe-pw-145353v3

  IGT_8247: 8247
  xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475: d5debc4841e604372c74ebda0bbf54bd527c3475
  xe-pw-145353v3: 145353v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/index.html

--===============2725668269456510275==
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
<tr><td><b>Series:</b></td><td>drm/dp: Fix link training interrupted by HPD=
 pulse (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145353/">https://patchwork.freedesktop.org/series/145353/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145353v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145353v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2709-d5debc4841e604372c74ebda0bbf54bd5=
27c3475_full -&gt; xe-pw-145353v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145353v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145353v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1453=
53v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_faul=
t_injection@vm-bind-fail-xe_sync_entry_parse.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/i=
gt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">DMESG-WARN</a>=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@modeset-stress-extra-wait:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-433/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-=
435/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145353v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/s=
hard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/s=
hard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_bw@linear-tiling-4-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +134 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199">Intel XE#4199=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg=
2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4330">Intel XE#4330</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_content_protection@atom=
ic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_content_protection@srm@=
pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_curs=
or_crc@cursor-offscreen-64x64.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_cursor_crc@=
cursor-offscreen-64x64.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_flip@2x-absolute-w=
f_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@kms_flip@2x-dpms-=
vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend=
@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +2 other tests dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-rec=
reate-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-lnl-1/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-lnl-2/igt@kms_flip@f=
lip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-4=
34/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-435/igt@kms_flip@flip-vs-s=
uspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-=
464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">I=
ntel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test=
 skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1 o=
ther test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-lnl-2/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-lnl-8/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@xe_eudebug_online@interrupt-a=
ll-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-d=
g2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@xe_pm_re=
sidency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@xe_pm_residency@cpg-basic.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4330">Intel XE#4330</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-9/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145353v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_co=
lor@ctm-blue-to-red@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard=
-dg2-433/igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms=
_cursor_crc@cursor-suspend.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/s=
hard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html=
">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145353v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@kms_fbc=
on_fbt@fbc.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@kms_fbcon_fbt@fbc.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_fe=
ature_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_=
feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-5/igt@kms_flip@2x=
-flip-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_fl=
ip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-463/igt@kms_flip@2=
x-nonexisting-fb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/sha=
rd-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-433=
/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> +4 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/=
igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +2 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353=
v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-1/igt@kms_pipe=
_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4016">Intel XE#4016</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3=
/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-1/igt@kms_pipe=
_crc_basic@suspend-read-crc@pipe-d-dp-2.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4016">Intel XE#4016</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/s=
hard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/=
igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-lnl-3/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-lnl-7/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1=
392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45353v3/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr=
-invalidate.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-145353v3/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-funct=
ion-xe_guc_ads_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-434/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard=
-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@xe_vm@=
bind-array-enobufs.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/igt@xe_vm@bind-array-enobufs=
.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-463/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-dp-4.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#43=
30</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5353v3/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-d=
p-4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-145353v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_cc=
s@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/=
shard-dg2-464/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-bmg-4/igt@k=
ms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145353v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-432/igt@kms_=
flip@2x-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-=
bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">=
Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-435/igt@kms_=
flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145353v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45353v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145353v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Inte=
l XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145353v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45353v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353=
v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-464/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-ad=
lp-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c347=
5/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd52=
7c3475/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf5=
4bd527c3475/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda=
0bbf54bd527c3475/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c7=
4ebda0bbf54bd527c3475/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604=
372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc484=
1e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5de=
bc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709=
-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c347=
5/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf54bd52=
7c3475/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda0bbf5=
4bd527c3475/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c74ebda=
0bbf54bd527c3475/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604372c7=
4ebda0bbf54bd527c3475/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2709-d5debc4841e604=
372c74ebda0bbf54bd527c3475/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-145353v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1453=
53v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-145353v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-a=
dlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145353v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-145353v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-ad=
lp-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145353v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145353v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-145353v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145353v3/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353=
v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-adlp-9/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145353v3/shard-dg2-466/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475 -&gt; xe-pw-145=
353v3</li>
</ul>
<p>IGT_8247: 8247<br />
  xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475: d5debc4841e604372c74ebd=
a0bbf54bd527c3475<br />
  xe-pw-145353v3: 145353v3</p>

</body>
</html>

--===============2725668269456510275==--
