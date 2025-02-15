Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709C6C021A0
	for <intel-xe@archiver.kernel.org>; Sat, 15 Feb 2025 20:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF9610E1CC;
	Sat, 15 Feb 2025 20:16:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D054110E0BE;
 Sat, 15 Feb 2025 20:16:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2742852561624953709=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?3=5D_drm/xe/display=3A_Move_display_runtime_suspend_to_a_later_po?=
 =?utf-8?q?int?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Feb 2025 20:16:55 -0000
Message-ID: <173965061584.2724754.8194298397868819957@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214175600.504481-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250214175600.504481-1-rodrigo.vivi@intel.com>
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

--===============2742852561624953709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe/display: Move display runtime suspend to a later point
URL   : https://patchwork.freedesktop.org/series/144900/
State : failure

== Summary ==

CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_full -> xe-pw-144900v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144900v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144900v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144900v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][2] -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +13 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +13 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] +12 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-7/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@xe_pm@s2idle-basic-exec.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html

  
#### Warnings ####

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#314]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-adlp:         [DMESG-WARN][14] ([Intel XE#2953]) -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_pm@d3hot-mmap-system.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-9/igt@xe_pm@d3hot-mmap-system.html

  
Known issues
------------

  Here are the changes found in xe-pw-144900v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-256:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#2953])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_addfb_basic@bad-pitch-256.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@kms_addfb_basic@bad-pitch-256.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#2191]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +34 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4010])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#373]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#309]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#877])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#4302])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#301]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][41] ([Intel XE#1033]) +14 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2-set2:     [PASS][42] -> [SKIP][43] ([Intel XE#310]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_flip@2x-plain-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2316]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#886])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#886]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#4172]) +4 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][57] -> [DMESG-FAIL][58] ([Intel XE#1033]) +2 other tests dmesg-fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#656]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#651]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#356])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#616]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2763]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1129])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#836])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2042])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1489])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2850] / [Intel XE#929])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_psr@psr-no-drrs.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#756])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1123])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2905]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#3592])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-hang-userptr:
    - shard-dg2-set2:     [PASS][80] -> [DMESG-WARN][81] ([Intel XE#1033]) +8 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#4173])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#1192])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [PASS][86] -> [SKIP][87] ([Intel XE#1192])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#1192])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2541] / [Intel XE#3573])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#569])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#4273])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][94] ([Intel XE#3908]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#3225]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-bmg:          [DMESG-WARN][98] ([Intel XE#877]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_color@legacy-gamma-reset.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][100] ([Intel XE#2291]) -> [PASS][101] +3 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#4302]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][104] ([Intel XE#3321]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#310]) -> [PASS][107] +6 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][108] ([Intel XE#2316]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][110] ([Intel XE#2882]) -> [PASS][111] +2 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][112] ([Intel XE#301]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#301]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#2953]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#656]) -> [PASS][119] +5 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][120] ([Intel XE#718]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vblank@query-forked-busy:
    - shard-adlp:         [DMESG-WARN][122] -> [PASS][123] +2 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@kms_vblank@query-forked-busy.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-9/igt@kms_vblank@query-forked-busy.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][124] ([Intel XE#2142]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - shard-bmg:          [DMESG-WARN][126] ([Intel XE#4172]) -> [PASS][127] +6 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#1033]) -> [PASS][129] +10 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@xe_gt_freq@freq_range_exec.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][130] ([Intel XE#4173]) -> [PASS][131] +6 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#787]) -> [SKIP][133] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][135] ([Intel XE#787]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [INCOMPLETE][137] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4010])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#455]) -> [FAIL][139] ([Intel XE#1178])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_content_protection@srm.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#4172]) -> [SKIP][141] ([Intel XE#2291])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#310]) -> [FAIL][143] ([Intel XE#301])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#310]) -> [DMESG-WARN][145] ([Intel XE#1033])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#310]) -> [DMESG-FAIL][147] ([Intel XE#1033])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2-set2:     [DMESG-WARN][148] ([Intel XE#1033]) -> [DMESG-WARN][149] ([Intel XE#2955])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@basic-flip-vs-dpms.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][150] ([Intel XE#2311]) -> [SKIP][151] ([Intel XE#2312]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [SKIP][153] ([Intel XE#2311]) +10 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][154] ([Intel XE#4141]) -> [SKIP][155] ([Intel XE#2312]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([Intel XE#4141]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#656]) -> [SKIP][159] ([Intel XE#651]) +11 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#651]) -> [SKIP][161] ([Intel XE#656]) +17 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [SKIP][163] ([Intel XE#2313]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#656]) -> [SKIP][165] ([Intel XE#653]) +12 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][166] ([Intel XE#2313]) -> [SKIP][167] ([Intel XE#2312]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#653]) -> [SKIP][169] ([Intel XE#656]) +16 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][170] ([Intel XE#3544]) -> [SKIP][171] ([Intel XE#3374] / [Intel XE#3544])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#455]) -> [DMESG-WARN][173] ([Intel XE#1033])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_vrr@negative-basic.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][174] ([Intel XE#2833]) -> [SKIP][175] ([Intel XE#1192])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html
    - shard-adlp:         [SKIP][176] ([Intel XE#455]) -> [SKIP][177] ([Intel XE#1192])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-6/igt@xe_live_ktest@xe_eudebug.html
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#455]) -> [SKIP][179] ([Intel XE#1192])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@xe_live_ktest@xe_eudebug.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#1999]) -> [SKIP][181] ([Intel XE#1192])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][182] ([Intel XE#4268]) -> [ABORT][183] ([Intel XE#4054] / [Intel XE#4268])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -> xe-pw-144900v1

  IGT_8230: 8230
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36
  xe-pw-144900v1: 144900v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/index.html

--===============2742852561624953709==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe/display: Move display runtime suspend to a later point</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144900/">https://patchwork.freedesktop.org/series/144900/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_full -&gt; xe-pw-144900v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144900v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144900v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144900v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-7/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-9/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144900v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@kms_addfb_basic@bad-pitch-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592">Intel XE#3592</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_color@legacy-gamma-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_color@legacy-gamma-reset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@kms_vblank@query-forked-busy.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-9/igt@kms_vblank@query-forked-busy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@xe_gt_freq@freq_range_exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-434/igt@kms_vrr@negative-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144900v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054">Intel XE#4054</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -&gt; xe-pw-144900v1</li>
</ul>
<p>IGT_8230: 8230<br />
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36<br />
  xe-pw-144900v1: 144900v1</p>

</body>
</html>

--===============2742852561624953709==--
