Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DB8C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EDF10E0AA;
	Wed, 14 May 2025 08:01:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA7310E0AA;
 Wed, 14 May 2025 08:01:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1660908996963646931=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vf=3A_Fail_migratio?=
 =?utf-8?q?n_recovery_if_fixups_needed_but_platform_not_supported_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 08:01:02 -0000
Message-ID: <174720966279.77507.15473410982605513218@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512230614.571026-1-tomasz.lis@intel.com>
In-Reply-To: <20250512230614.571026-1-tomasz.lis@intel.com>
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

--===============1660908996963646931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev2)
URL   : https://patchwork.freedesktop.org/series/148914/
State : failure

== Summary ==

CI Bug Log - changes from xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297_FULL -> xe-pw-148914v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148914v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148914v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148914v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  
#### Warnings ####

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#4208]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
Known issues
------------

  Here are the changes found in xe-pw-148914v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#4963])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7] ([Intel XE#4208]) +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#4208] / [Intel XE#4618])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@intel_sysfs_debugfs@xe-forcewake.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4543]) +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2231] / [Intel XE#4996]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][19] ([Intel XE#4543])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#4543])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2191]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +181 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#787]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#3442])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2907])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#307])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178]) +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#3304])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#308])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2320])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1475])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#323]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2286])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#3009])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_dp_aux_dev.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#4354])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#776])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2316]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#301])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#3321])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#3321]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][67] -> [SKIP][68] ([Intel XE#4208] / [i915#2575]) +103 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_flip@busy-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#301] / [Intel XE#3321])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][70] ([Intel XE#301]) +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#4173])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455]) +12 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#455]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +20 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#656]) +17 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#651]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#653]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#653]) +17 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#1503]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_hdr@static-toggle.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#3012])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2925])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][91] ([Intel XE#1035])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][92] ([Intel XE#2078]) +1 other test warn
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#616]) +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#4596])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#4596]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#5020])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#5020])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2571])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [ABORT][101] ([Intel XE#4760]) +1 other test abort
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][102] ([Intel XE#4212])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2763]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#908])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1129])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1489]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1489])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1489]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#3414])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#3414]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1127])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4954] / [Intel XE#4996]) +22 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#2883]) +2 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#1435])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2426])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][122] ([Intel XE#1729])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1447]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1123])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#4837]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4837]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4837]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#4519])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#688])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#4208]) +228 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2322])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][134] -> [SKIP][135] ([Intel XE#1392]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1392]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1392]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#288]) +8 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#288]) +14 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_system_allocator@many-free:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4996]) +17 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_exec_system_allocator@many-free.html

  * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4943]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#4915]) +72 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_exec_system_allocator@many-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#4915]) +92 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> [FAIL][144] ([Intel XE#5012])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-bmg:          NOTRUN -> [FAIL][145] ([Intel XE#5012])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#512])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1008])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#378])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2541] / [Intel XE#3573])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1061])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#2284] / [Intel XE#366])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][156] -> [ABORT][157] ([Intel XE#1794])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][158] -> [ABORT][159] ([Intel XE#1794])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-4/igt@xe_pm@s4-exec-after.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#4733]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#4733])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#944])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#944])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#4130]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4273])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#4208]) +45 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2134]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@fbdev@read.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@fbdev@read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][169] ([Intel XE#827]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#3862]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][173] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][175] ([Intel XE#2291]) -> [PASS][176] +11 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][177] ([Intel XE#1340]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][179] ([Intel XE#4294]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][181] ([Intel XE#301]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][183] ([Intel XE#2316]) -> [PASS][184] +7 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [INCOMPLETE][185] ([Intel XE#2049]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208] / [i915#2575]) -> [PASS][188] +68 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][189] ([Intel XE#2882]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-lnl:          [FAIL][191] ([Intel XE#886]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][193] ([Intel XE#301]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][198] +5 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [ABORT][199] -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][201] ([Intel XE#1503]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_hdr@static-swap.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][203] ([Intel XE#3012]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][205] ([Intel XE#718]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][207] ([Intel XE#1435]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_create@create-invalid-size:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4208]) -> [PASS][210] +147 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_create@create-invalid-size.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_create@create-invalid-size.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1392]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][213] ([Intel XE#5018]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][215] ([Intel XE#3876]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-dg2-set2:     [ABORT][217] -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][219] ([Intel XE#4792]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [SKIP][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246]) ([Intel XE#378]) -> ([PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-8/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-1/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-1/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-1/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-3/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-8/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-4/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-8/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][272] ([Intel XE#4208]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_module_load@reload-no-display.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][274] ([Intel XE#1794]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#623]) -> [SKIP][277] ([Intel XE#4208] / [i915#2575])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][279] ([Intel XE#316])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#316]) -> [SKIP][281] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#4208]) -> [SKIP][283] ([Intel XE#316]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#316]) -> [SKIP][285] ([Intel XE#4208]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][287] ([Intel XE#1124]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][289] ([Intel XE#619])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1124]) -> [SKIP][291] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1124]) -> [SKIP][293] ([Intel XE#4208]) +8 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#4208]) -> [SKIP][295] ([Intel XE#1124]) +5 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208] / [i915#2575]) -> [SKIP][297] ([Intel XE#2191]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2191]) -> [SKIP][299] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#4208] / [i915#2575]) -> [SKIP][301] ([Intel XE#367]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#367]) -> [SKIP][303] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][305] ([Intel XE#455] / [Intel XE#787])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][307] ([Intel XE#4208]) +12 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#4208]) -> [SKIP][309] ([Intel XE#2907])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][311] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][312] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][313] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#4208]) -> [SKIP][315] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#373]) -> [SKIP][317] ([Intel XE#4208] / [i915#2575]) +11 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#4208] / [i915#2575]) -> [SKIP][319] ([Intel XE#306]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#306]) -> [SKIP][321] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#4208] / [i915#2575]) -> [SKIP][323] ([Intel XE#373]) +8 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][324] ([Intel XE#1178]) -> [SKIP][325] ([Intel XE#2341])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_content_protection@atomic.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [INCOMPLETE][326] -> [FAIL][327] ([Intel XE#1178]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#307]) -> [SKIP][329] ([Intel XE#4208] / [i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][330] ([Intel XE#1178]) -> [SKIP][331] ([Intel XE#4208] / [i915#2575])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_content_protection@legacy.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#4208] / [i915#2575]) -> [FAIL][333] ([Intel XE#1178])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][334] ([Intel XE#2341]) -> [FAIL][335] ([Intel XE#1178]) +2 other tests fail
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_content_protection@srm.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208] / [i915#2575]) -> [SKIP][337] ([Intel XE#308]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#308]) -> [SKIP][339] ([Intel XE#4208] / [i915#2575])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#4354]) -> [SKIP][341] ([Intel XE#4208])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-mst.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#4208]) -> [SKIP][343] ([Intel XE#4356])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#4356]) -> [SKIP][345] ([Intel XE#4208])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#455]) -> [SKIP][347] ([Intel XE#4208]) +8 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#4422]) -> [SKIP][349] ([Intel XE#4208]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#703]) -> [SKIP][351] ([Intel XE#4208] / [i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#4208] / [i915#2575]) -> [SKIP][353] ([Intel XE#1135])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][354] ([Intel XE#2316]) -> [FAIL][355] ([Intel XE#3321])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#4208]) -> [SKIP][357] ([Intel XE#455]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#455]) -> [SKIP][359] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][361] ([Intel XE#455]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][362] ([Intel XE#2312]) -> [SKIP][363] ([Intel XE#2311]) +27 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#651]) -> [SKIP][365] ([Intel XE#4208]) +24 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][367] ([Intel XE#651]) +8 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][368] ([Intel XE#2312]) -> [SKIP][369] ([Intel XE#4141]) +8 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][370] ([Intel XE#4141]) -> [SKIP][371] ([Intel XE#2312]) +16 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#651]) -> [SKIP][373] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][374] ([Intel XE#2311]) -> [SKIP][375] ([Intel XE#2312]) +24 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#4208]) -> [SKIP][377] ([Intel XE#651]) +13 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#4208]) -> [SKIP][379] ([Intel XE#653]) +15 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][381] ([Intel XE#653]) +6 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][383] ([Intel XE#658])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1158]) -> [SKIP][385] ([Intel XE#4208])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][386] ([Intel XE#2313]) -> [SKIP][387] ([Intel XE#2312]) +26 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][388] ([Intel XE#2312]) -> [SKIP][389] ([Intel XE#2313]) +26 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#653]) -> [SKIP][391] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#653]) -> [SKIP][393] ([Intel XE#4208]) +29 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#4208] / [i915#2575]) -> [SKIP][395] ([Intel XE#455]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          [SKIP][396] ([Intel XE#3544]) -> [SKIP][397] ([Intel XE#3374] / [Intel XE#3544])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#346]) -> [SKIP][399] ([Intel XE#4208])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2925]) -> [SKIP][401] ([Intel XE#4208]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#4208]) -> [SKIP][403] ([Intel XE#4359])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][404] ([Intel XE#4596]) -> [SKIP][405] ([Intel XE#5021])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#5021]) -> [SKIP][407] ([Intel XE#4208] / [i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-yf.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#4208] / [i915#2575]) -> [SKIP][409] ([Intel XE#2763] / [Intel XE#455])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][411] ([Intel XE#4208] / [i915#2575])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#4208]) -> [SKIP][413] ([Intel XE#870])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#4208]) -> [SKIP][415] ([Intel XE#2938])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#870]) -> [SKIP][417] ([Intel XE#4208]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1129]) -> [SKIP][419] ([Intel XE#2351] / [Intel XE#4208])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-dg2-set2:     [FAIL][420] ([Intel XE#5017]) -> [SKIP][421] ([Intel XE#4208] / [i915#2575])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_properties@get_properties-sanity-atomic.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#1489]) -> [SKIP][423] ([Intel XE#4208]) +8 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#4208]) -> [SKIP][425] ([Intel XE#1489]) +4 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#4208]) -> [SKIP][427] ([Intel XE#1122])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][429] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][431] ([Intel XE#4208]) +9 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][433] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#4208]) -> [SKIP][435] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr@psr2-sprite-plane-move.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2939]) -> [SKIP][437] ([Intel XE#4208])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#4208] / [i915#2575]) -> [SKIP][439] ([Intel XE#1127]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#3414]) -> [SKIP][441] ([Intel XE#4208] / [i915#2575])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#455]) -> [SKIP][443] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#4208] / [i915#2575]) -> [SKIP][445] ([Intel XE#2168])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_vrr@lobf.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#756]) -> [SKIP][447] ([Intel XE#4208] / [i915#2575])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#4208] / [i915#2575]) -> [SKIP][449] ([Intel XE#756])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][451] ([Intel XE#4208])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#4208]) -> [SKIP][453] ([Intel XE#1123])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#4497]) -> [SKIP][455] ([Intel XE#4208])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#4208]) -> [SKIP][457] ([Intel XE#4497]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#4208]) -> [SKIP][459] ([Intel XE#4837]) +13 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_eudebug@basic-close.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#4837]) -> [SKIP][461] ([Intel XE#4208]) +14 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#288]) -> [SKIP][463] ([Intel XE#4208]) +28 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#4208]) -> [SKIP][465] ([Intel XE#288]) +20 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2360]) -> [SKIP][467] ([Intel XE#4208]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#4915]) -> [SKIP][469] ([Intel XE#4208]) +209 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#4208]) -> [SKIP][471] ([Intel XE#4915]) +142 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#255]) -> [SKIP][473] ([Intel XE#4208])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#560]) -> [SKIP][475] ([Intel XE#4208])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#4208]) -> [SKIP][477] ([Intel XE#4501])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@buffer-size.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_oa@buffer-size.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][479] ([Intel XE#4208]) +4 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_oa@missing-sample-flags.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#4208]) -> [SKIP][481] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][483] ([Intel XE#4208]) +2 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#4208]) -> [SKIP][485] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#977]) -> [SKIP][487] ([Intel XE#4208])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][488] ([Intel XE#1173]) -> [SKIP][489] ([Intel XE#1061])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_peer2peer@read.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][490] ([Intel XE#1173]) -> [SKIP][491] ([Intel XE#1061] / [Intel XE#4208])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_peer2peer@write.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#2284]) -> [SKIP][493] ([Intel XE#4208])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][495] ([Intel XE#4208]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#4208]) -> [SKIP][497] ([Intel XE#2284] / [Intel XE#366])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#579]) -> [SKIP][499] ([Intel XE#4208])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#4650]) -> [SKIP][501] ([Intel XE#4208]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_pmu@all-fn-engine-activity-load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#4733]) -> [SKIP][503] ([Intel XE#4208]) +2 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#4208]) -> [SKIP][505] ([Intel XE#4733]) +2 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#944]) -> [SKIP][507] ([Intel XE#4208]) +2 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#4208]) -> [SKIP][509] ([Intel XE#944])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_query@multigpu-query-topology.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#4814]) -> [SKIP][511] ([Intel XE#4208])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_render_copy@render-stress-1-copies.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#4130]) -> [SKIP][513] ([Intel XE#4208])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#4208]) -> [SKIP][515] ([Intel XE#4130])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#4273]) -> [SKIP][517] ([Intel XE#4208])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_sriov_flr@flr-twice.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#4351]) -> [SKIP][519] ([Intel XE#4208])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297 -> xe-pw-148914v2

  IGT_8362: 8362
  xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297: dac27c03b365c9da3d8af23f7067f7f4e5a74297
  xe-pw-148914v2: 148914v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/index.html

--===============1660908996963646931==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fail migration recovery if fixups=
 needed but platform not supported (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148914/">https://patchwork.freedesktop.org/series/148914/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148914v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148914v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3083-dac27c03b365c9da3d8af23f7067f7f4e=
5a74297_FULL -&gt; xe-pw-148914v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148914v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148914v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1489=
14v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-1/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a=
> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2=
/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.ht=
ml">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148914v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@core_hotunplug@unplug-rescan.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@core_s=
etmaster@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@core_setmaste=
r@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@intel_=
sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@intel_sysfs_debu=
gfs@xe-forcewake.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp=
-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_atomic_transition@modes=
et-transition-nonblocking-fencing.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_big_fb@x-t=
iled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/s=
hard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +33 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_chamelium_color@ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_chamelium_frames@vga-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-466/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_cursor_crc@cursor-offscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid=
-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</=
li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-on-=
nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vb=
lank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996"=
>Intel XE#4996</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_hdr@=
static-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_plane@pixel-format-sourc=
e-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_plane_multiple@2x-tiling=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4760">Intel XE#4760</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_psr2_sf@pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_sequence@get-idle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/495=
4">Intel XE#4954</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4996">Intel XE#4996</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-4/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-line=
ar-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_eudebug@basic-vm-access-p=
arameters-userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_eudebug@multiple-session=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_evict@evict-large-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_exec_basic@many=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) +228 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_exec_fault_mode@many-exec=
queues-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_exec_fault_mode@once-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_exec_system_allocator@many=
-free.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4996">Intel XE#4996</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_exec_system_allocator@many=
-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@xe_exec_system_allocator@man=
y-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4915">Intel XE#4915</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-execqueues-new-race-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +92 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">=
Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_oa@non-privileged-access-=
vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_peer2peer@read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_pm@s4=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">In=
tel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-4/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148914v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">=
Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_pxp@pxp-termination-key-=
update-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_pxp@pxp-termination-key-u=
pdate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-=
list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_query@multigpu-query-pxp-=
status.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_vm@munmap-style-unbind-u=
serptr-inval-many-either-side-partial.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +45 othe=
r tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@fbdev@read.html">PASS</a=
> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/ig=
t@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148914v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148914v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148914v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@km=
s_flip@2x-flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7/=
igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +68 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>=
 +1 other test pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-l=
nl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148914v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xti=
le-to-64bpp-xtile-upscaling.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-8/igt@kms_hdm=
i_inject@inject-audio.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-6/igt@kms_hdmi_inject@injec=
t-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-7=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-3/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_cre=
ate@create-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_cr=
eate@create-invalid-size.html">PASS</a> +147 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shar=
d-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148914v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_exe=
c_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_fau=
lt_injection@exec-queue-create-fail-xe_exec_queue_create.html">ABORT</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_crea=
te.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-8/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel=
 XE#4792</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148914v2/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a7=
4297/shard-lnl-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4=
e5a74297/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067=
f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f=
7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8a=
f23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da=
3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365=
c9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03=
b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac2=
7c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-=
dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a7429=
7/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
914v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148914v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
914v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148914v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
914v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148914v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
914v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148914v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
914v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148914v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_mod=
ule_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe=
_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-adlp-2/igt@xe_pm@s4-d=
3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-=
464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@km=
s_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bi=
g_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@k=
ms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@k=
ms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/=
igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148914v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rota=
te-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148914v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-46=
4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cc=
s@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
914v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148914v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148914v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-=
434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_cham=
elium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/s=
hard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_chame=
lium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ch=
amelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-43=
4/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-2/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-4/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_co=
ntent_protection@atomic-dpms.html">INCOMPLETE</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/=
igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2=
/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@=
kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@k=
ms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_dp=
_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_d=
p_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_ds=
c@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/=
igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-for=
mats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_=
feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-43=
4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148914v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to=
-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148914v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp=
-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/s=
hard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48914v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v=
2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148914v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8914v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48914v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v=
2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v=
2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel=
 XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8914v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48914v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +29 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_hd=
r@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-4=
35/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other test=
s skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_jo=
iner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt=
@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/sha=
rd-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pi=
pe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/=
igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48914v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@k=
ms_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@km=
s_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_pr=
operties@get_properties-sanity-atomic.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5017">Intel XE#5017</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2=
-464/igt@kms_properties@get_properties-sanity-atomic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148914v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@km=
s_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_ps=
r@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-d=
g2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_=
psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ps=
r@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@kms_=
psr@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@kms_ps=
r_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/s=
hard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48914v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard=
-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_wr=
iteback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-=
dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/s=
hard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_eu_sta=
ll@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4497">Intel XE#4497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48914v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-in=
validate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shar=
d-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg=
2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_exe=
c_system_allocator@process-many-large-execqueues-mmap-nomemset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">In=
tel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148914v2/shard-dg2-464/igt@xe_exec_system_allocator@process-many-lar=
ge-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +209 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148914v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-v=
m-many-mmap-shared-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +142 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_media_fil=
l@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_oa@=
missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-46=
4/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@=
syncs-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_oa@sync=
s-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
14v2/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@=
whitelisted-registers-userspace-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg=
2-435/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pat@pat-index=
-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-=
464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_pm@=
s4-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-434/igt@xe_pm@s4=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@=
xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_pxp=
@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-d=
g2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE=
#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_=
query@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-435/igt@xe=
_query@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE=
#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148914v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148914v2/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprov=
ision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_sri=
ov_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg2-464/igt@xe_sriov_flr=
@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v2/shard-dg=
2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297 -&gt; xe-pw-148=
914v2</li>
</ul>
<p>IGT_8362: 8362<br />
  xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297: dac27c03b365c9da3d8af23=
f7067f7f4e5a74297<br />
  xe-pw-148914v2: 148914v2</p>

</body>
</html>

--===============1660908996963646931==--
