Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B24AC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 23:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B4310E124;
	Thu,  1 Aug 2024 23:24:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF00A10E0FC;
 Thu,  1 Aug 2024 23:24:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4926461753590959038=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/3=5D_?=
 =?utf-8?q?Revert_=22drm/xe/guc=3A_Pre-release_GuC_firmware_v70=2E24=2E0_for?=
 =?utf-8?q?_LNL/BMG/PVC=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 23:24:54 -0000
Message-ID: <172255469470.489703.10052748580173597894@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
In-Reply-To: <20240801203341.3042386-1-julia.filipchuk@intel.com>
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

--===============4926461753590959038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
URL   : https://patchwork.freedesktop.org/series/136813/
State : failure

== Summary ==

CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_full -> xe-pw-136813v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-136813v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136813v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136813v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201]) -> [SKIP][2] +23 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@atomic-dpms:
    - {shard-bmg}:        [FAIL][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [SKIP][5] ([Intel XE#2291]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * {igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2}:
    - {shard-bmg}:        [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2.html

  * igt@kms_hdr@static-toggle:
    - {shard-bmg}:        [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - {shard-bmg}:        [PASS][11] -> [INCOMPLETE][12] +7 other tests incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html

  
Known issues
------------

  Here are the changes found in xe-pw-136813v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     NOTRUN -> [ABORT][15] ([Intel XE#2421])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#1426]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1426]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#1659])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][26] ([Intel XE#1204])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][27] ([Intel XE#324])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#314])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1138] / [Intel XE#1201])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1195]) +1 other test incomplete
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][50] ([Intel XE#1551]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#1874]) +2 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#656]) +20 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1151] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1158] / [Intel XE#1201])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][61] -> [DMESG-FAIL][62] ([Intel XE#324]) +1 other test dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#324]) +2 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1620])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-41:
    - shard-lnl:          [PASS][69] -> [DMESG-FAIL][70] ([Intel XE#1620])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-41.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-2/igt@kms_pm_rpm@legacy-planes@plane-41.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1489])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1122] / [Intel XE#1201])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#327])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1127] / [Intel XE#1201])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1127] / [Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][79] -> [FAIL][80] ([Intel XE#771] / [Intel XE#899])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][81] -> [FAIL][82] ([Intel XE#899])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][83] ([Intel XE#2019]) +1 other test dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#1050])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1126] / [Intel XE#1201])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][87] -> [TIMEOUT][88] ([Intel XE#1473] / [Intel XE#392])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#261])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][90] -> [TIMEOUT][91] ([Intel XE#1473] / [Intel XE#402])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][92] -> [TIMEOUT][93] ([Intel XE#1473])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1392])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#2360])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-adlp:         [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1169] / [Intel XE#1195])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#512])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#2284])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [PASS][107] -> [INCOMPLETE][108] ([Intel XE#1195] / [Intel XE#1358])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][109] ([Intel XE#1551] / [Intel XE#569])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#958])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#324]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][115] ([Intel XE#2338]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - {shard-bmg}:        [FAIL][117] ([Intel XE#2436]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - {shard-bmg}:        [SKIP][119] ([Intel XE#2291]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - {shard-bmg}:        [SKIP][121] ([Intel XE#2316]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][123] ([Intel XE#1874]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2:
    - {shard-bmg}:        [INCOMPLETE][125] -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][127] ([Intel XE#2019]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - {shard-bmg}:        [DMESG-WARN][129] -> [PASS][130] +6 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][131] ([Intel XE#324]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - {shard-bmg}:        [SKIP][133] -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [FAIL][137] ([Intel XE#2028]) -> [PASS][138] +8 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - {shard-bmg}:        [SKIP][139] ([Intel XE#1435]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#771] / [Intel XE#899]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#899]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
    - shard-lnl:          [FAIL][145] -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [TIMEOUT][147] -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@xe_evict@evict-cm-threads-large.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#1600]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][151] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-dg2-set2:     [INCOMPLETE][153] ([Intel XE#1169] / [Intel XE#1356]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [FAIL][155] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][157] ([Intel XE#1358]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][159] ([Intel XE#1794]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_atomic@atomic-invalid-params:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [i915#2575]) -> [SKIP][162] ([i915#2575]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_atomic@atomic-invalid-params.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][164] ([Intel XE#316]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#316]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#610]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#610])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1124]) -> [SKIP][170] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][172] ([Intel XE#1124]) +6 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][173] ([Intel XE#1231]) -> [FAIL][174] ([Intel XE#1242]) +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#346]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#346])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_joiner@basic.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][178] ([Intel XE#367]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#2191]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][182] ([Intel XE#2191]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#367]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][188] ([Intel XE#787]) +55 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][190] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#787]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][194] ([Intel XE#314])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1152]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][198] ([Intel XE#306])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#306]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#306])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][202] ([Intel XE#373]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#373]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#307]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#307])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][208] ([Intel XE#308]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#308]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#308])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][212] ([Intel XE#2423] / [i915#2575]) +20 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][213] ([i915#3804]) -> [SKIP][214] ([Intel XE#1201] / [i915#3804])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#701]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#701])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][218] ([Intel XE#455]) +8 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][220] ([Intel XE#2351]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][221] ([i915#5274]) -> [SKIP][222] ([Intel XE#1201] / [i915#5274])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][224] ([Intel XE#651]) +20 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#651]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#653]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][230] ([Intel XE#653]) +22 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#356]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#356])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#455]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2318]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#908]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#908])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1489]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][244] ([Intel XE#1489]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1122]) -> [SKIP][246] ([Intel XE#1122] / [Intel XE#1201])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][248] ([Intel XE#929]) +9 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#929]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][252] ([Intel XE#1149])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][254] ([Intel XE#1127])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#327]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#330]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#330])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][260] ([Intel XE#756])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1091]) -> [SKIP][262] ([Intel XE#1091] / [Intel XE#1201])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][266] ([Intel XE#1126])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1126]) -> [SKIP][268] ([Intel XE#1126] / [Intel XE#1201])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][269] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][270] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][271] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][272] ([Intel XE#1473] / [Intel XE#392])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#288]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][276] ([Intel XE#288]) +17 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2360]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#2360])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][280] ([Intel XE#255])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][282] ([Intel XE#378])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#2136]) -> [DMESG-FAIL][284] ([Intel XE#2019])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_module_load@reload.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][286] ([Intel XE#2419]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_oa@buffer-fill.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2419]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#2419]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][290] ([Intel XE#1337])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#979]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#979])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1061] / [Intel XE#1201]) -> [SKIP][294] ([Intel XE#1061])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_peer2peer@read.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][298] ([Intel XE#2284] / [Intel XE#366])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][300] ([Intel XE#579])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][302] ([Intel XE#944]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#944]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@large-misaligned-binds-536870912:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][306] ([Intel XE#1130]) +37 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_vm@large-misaligned-binds-536870912.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_vm@large-misaligned-binds-536870912.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
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
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-pw-136813v1

  IGT_7951: 7951
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
  xe-pw-136813v1: 136813v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/index.html

--===============4926461753590959038==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] Revert &quot;drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136813/">https://patchwork.freedesktop.org/series/136813/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_full -&gt; xe-pw-136813v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-136813v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136813v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136813v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136813v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-2/igt@kms_pm_rpm@legacy-planes@plane-41.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@xe_evict@evict-beng-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-0.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_plane@pixel-format@pipe-b-plane-0.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-3/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_atomic@atomic-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_atomic@atomic-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-436/igt@xe_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_vm@large-misaligned-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136813v1/shard-dg2-432/igt@xe_vm@large-misaligned-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +37 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -&gt; xe-pw-136813v1</li>
</ul>
<p>IGT_7951: 7951<br />
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5<br />
  xe-pw-136813v1: 136813v1</p>

</body>
</html>

--===============4926461753590959038==--
