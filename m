Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBD1E6896C
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 10:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACB110E426;
	Thu, 31 Oct 2024 10:04:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849D10E2CC;
 Thu, 31 Oct 2024 10:04:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3550755485064111442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/psr=3A_Disable_Panel_R?=
 =?utf-8?q?eplay_as_well_if_VRR_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 10:04:30 -0000
Message-ID: <173036907054.1378613.10650228503798053174@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031081025.3215966-1-jouni.hogander@intel.com>
In-Reply-To: <20241031081025.3215966-1-jouni.hogander@intel.com>
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

--===============3550755485064111442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Disable Panel Replay as well if VRR is enabled
URL   : https://patchwork.freedesktop.org/series/140753/
State : failure

== Summary ==

CI Bug Log - changes from xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31_full -> xe-pw-140753v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140753v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140753v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140753v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_prime_self_import@export-vs-gem_close-race:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-5/igt@xe_prime_self_import@export-vs-gem_close-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-2/igt@xe_prime_self_import@export-vs-gem_close-race.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][7] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init}:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][9] +5 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html

  
Known issues
------------

  Here are the changes found in xe-pw-140753v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1125])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3194]) +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550]) +23 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#1701]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2890]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +41 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +23 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#2692])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1195] / [Intel XE#1727] / [Intel XE#2692])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1195])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2907]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1152] / [Intel XE#455])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1152]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#373]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455]) +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#308])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#323])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2286])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-3-pipe-d-dp-2:
    - shard-bmg:          [PASS][52] -> [DMESG-WARN][53] ([Intel XE#877]) +4 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-8/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-3-pipe-d-dp-2.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-3-pipe-d-dp-2.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#3009])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#3086]) +3 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-3/igt@kms_draw_crc@draw-method-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2373])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1135])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#301]) +6 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#310]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886]) +8 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_flip@busy-flip.html

  * igt@kms_flip@dpms-off-confusion@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][65] ([Intel XE#1195])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_flip@dpms-off-confusion@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#301]) +3 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#2953] / [Intel XE#3086]) +2 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +11 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#651]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#656]) +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +13 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#2333]) +3 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#653]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#653]) +15 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#3312])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#3312])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-436/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][82] -> [ABORT][83] ([Intel XE#2625]) +1 other test abort
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2925])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#346])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#3012])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][87] -> [FAIL][88] ([Intel XE#616]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2763]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#870])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#1430])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [PASS][95] -> [DMESG-WARN][96] ([Intel XE#3184])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1489]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1489])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1489]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2387])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2351] / [Intel XE#2890]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][105] ([Intel XE#1874]) +5 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1127]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#327])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#327]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#362])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#1523]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-4/igt@kms_vblank@accuracy-idle.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-5/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1499])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#756])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1091] / [Intel XE#2849])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#455] / [Intel XE#488])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#944])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#2667])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2905]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2905]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2905]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][123] -> [TIMEOUT][124] ([Intel XE#1473] / [Intel XE#402])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [PASS][125] -> [TIMEOUT][126] ([Intel XE#1473])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [PASS][127] -> [TIMEOUT][128] ([Intel XE#1473] / [Intel XE#2472])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#688])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1392]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1392]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1130]) +26 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][133] -> [FAIL][134] ([Intel XE#3160]) +3 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#288]) +10 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-lnl:          [PASS][136] -> [DMESG-WARN][137] ([Intel XE#2687])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][138] -> [FAIL][139] ([Intel XE#3320])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][140] -> [FAIL][141] ([Intel XE#3160]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +13 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-dg2-set2:     [PASS][143] -> [DMESG-WARN][144] ([Intel XE#358])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-433/igt@xe_exec_reset@close-execqueues-close-fd.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-464/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][145] ([Intel XE#1999]) +2 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#560])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#378])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_module_load@force-load.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2541]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][149] ([Intel XE#2249])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][150] ([Intel XE#2514])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#2541]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2284])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][153] -> [ABORT][154] ([Intel XE#1694] / [Intel XE#1794])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2284] / [Intel XE#366])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [PASS][156] -> [ABORT][157] ([Intel XE#1358])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@xe_pm@s3-exec-after.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][158] -> [ABORT][159] ([Intel XE#1358] / [Intel XE#1607])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@xe_pm@s4-basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][160] -> [ABORT][161] ([Intel XE#1794])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][162] -> [ABORT][163] ([Intel XE#1794])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#944])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#944])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     NOTRUN -> [FAIL][166] ([Intel XE#2922])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     NOTRUN -> [ABORT][167] ([Intel XE#3075] / [Intel XE#3084])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][168] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][170] ([Intel XE#1701]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#877]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [ABORT][174] ([Intel XE#2388]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-lnl:          [DMESG-WARN][176] ([Intel XE#2055]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#3184]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_cursor_legacy@torture-move.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_cursor_legacy@torture-move@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][180] -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_cursor_legacy@torture-move@all-pipes.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_cursor_legacy@torture-move@all-pipes.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][182] ([Intel XE#301]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#2597]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][186] ([Intel XE#2635]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [FAIL][188] ([Intel XE#3098]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][190] ([Intel XE#3252]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@dpms-off-confusion@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1195]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_flip@dpms-off-confusion@b-hdmi-a6.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_flip@dpms-off-confusion@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][194] ([Intel XE#886]) -> [PASS][195] +5 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][196] ([Intel XE#2882]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][198] -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][200] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][202] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][204] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][206] ([Intel XE#1874]) -> [PASS][207] +5 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [DMESG-WARN][208] ([Intel XE#2566] / [Intel XE#2929]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:
    - shard-lnl:          [DMESG-WARN][210] ([Intel XE#2929]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][212] ([Intel XE#2948]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [ABORT][214] ([Intel XE#1034] / [Intel XE#2625]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     [ABORT][216] ([Intel XE#1034]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html

  * igt@xe_exec_compute_mode@many-execqueues-rebind:
    - shard-adlp:         [TIMEOUT][218] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][219] +2 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@xe_exec_compute_mode@many-execqueues-rebind.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_exec_compute_mode@many-execqueues-rebind.html

  * igt@xe_exec_compute_mode@many-userptr-free:
    - shard-lnl:          [FAIL][220] -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-free.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-free.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [FAIL][222] ([Intel XE#3160]) -> [PASS][223] +3 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][224] ([Intel XE#3160]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][226] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [ABORT][228] ([Intel XE#1794]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@xe_pm@s3-mocs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][230] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@xe_pm@s4-basic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][232] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][234] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [FAIL][236] ([Intel XE#2564]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render:
    - shard-lnl:          [FAIL][238] ([Intel XE#3220]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][240] ([Intel XE#958]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][242] ([Intel XE#3194]) -> [FAIL][243] ([Intel XE#1231] / [Intel XE#1242])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][244] ([Intel XE#886]) -> [FAIL][245] ([Intel XE#3149] / [Intel XE#886])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-adlp:         [TIMEOUT][246] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][247] ([Intel XE#651])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [TIMEOUT][248] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][249] ([Intel XE#1861])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [TIMEOUT][250] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][251] ([Intel XE#653])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3220]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3220
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3252
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 -> xe-pw-140753v1

  IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31
  xe-pw-140753v1: 140753v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/index.html

--===============3550755485064111442==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Disable Panel Replay as well if VRR is enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140753/">https://patchwork.freedesktop.org/series/140753/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31_full -&gt; xe-pw-140753v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140753v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140753v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140753v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-5/igt@xe_prime_self_import@export-vs-gem_close-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-2/igt@xe_prime_self_import@export-vs-gem_close-race.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140753v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-8/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-3-pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-3-pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-3/igt@kms_draw_crc@draw-method-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_draw_crc@draw-method-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_flip@dpms-off-confusion@a-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-436/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-4/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-5/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-433/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-464/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-435/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388">Intel XE#2388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_cursor_legacy@torture-move@all-pipes.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_cursor_legacy@torture-move@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3252">Intel XE#3252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_flip@dpms-off-confusion@b-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-435/igt@kms_flip@dpms-off-confusion@b-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@xe_exec_compute_mode@many-execqueues-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@xe_exec_compute_mode@many-execqueues-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-free:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-free.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-dg2-434/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564">Intel XE#2564</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3220">Intel XE#3220</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 -&gt; xe-pw-140753v1</li>
</ul>
<p>IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31<br />
  xe-pw-140753v1: 140753v1</p>

</body>
</html>

--===============3550755485064111442==--
