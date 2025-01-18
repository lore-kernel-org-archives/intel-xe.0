Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA1DC02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 13:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C1610E206;
	Sat, 18 Jan 2025 13:06:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE110E0E6;
 Sat, 18 Jan 2025 13:06:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8080218259189009621=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dmc=5Fwl=3A_Intro?=
 =?utf-8?q?duce_debugfs_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 18 Jan 2025 13:06:39 -0000
Message-ID: <173720559924.1156675.4699994189841005990@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
In-Reply-To: <20250117220747.87927-1-gustavo.sousa@intel.com>
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

--===============8080218259189009621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc_wl: Introduce debugfs interface
URL   : https://patchwork.freedesktop.org/series/143695/
State : failure

== Summary ==

CI Bug Log - changes from xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4_full -> xe-pw-143695v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143695v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143695v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143695v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][5] ([Intel XE#2423]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling}:
    - shard-bmg:          [SKIP][7] ([Intel XE#1130]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
New tests
---------

  New tests have been introduced between xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4_full and xe-pw-143695v1_full:

### New IGT tests (1) ###

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  

Known issues
------------

  Here are the changes found in xe-pw-143695v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#1885]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@core_hotunplug@hotrebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          NOTRUN -> [ABORT][11] ([Intel XE#3914])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3249])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#3453])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2134]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@fbdev@pan.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@fbdev@pan.html

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1125])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#1033]) +3 other tests dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#827])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#3908]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2136]) +18 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +41 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2907])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1727] / [Intel XE#3113])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#3124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455]) +14 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#323])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#307])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#703])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1135])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#3321])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#3321])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#3098]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#301]) +5 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301] / [Intel XE#3321])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#2597]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [FAIL][70] ([Intel XE#886]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2293]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][74] -> [FAIL][75] ([Intel XE#1874]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#651]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +20 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +19 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#455])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][82] ([Intel XE#361]) +2 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2763]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2763]) +11 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#870])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2938])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1129]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2446]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_pm_rpm@i2c.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#2423]) +118 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2893])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1489]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1122])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1406])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1127])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1435])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#362])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#1130]) +261 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#3889])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@read-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2905]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2905]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1392]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#288]) +19 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2360])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2229])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][110] -> [FAIL][111] ([Intel XE#1999]) +2 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#1999]) +2 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#378])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137]) -> ([PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [SKIP][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162]) ([Intel XE#378])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-7/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-5/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-5/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-7/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-7/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-8/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-7/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-7/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-1/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-7/igt@xe_module_load@load.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@xe_oa@disabled-read-error.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1337])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1061])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#366])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][167] -> [ABORT][168] ([Intel XE#1358] / [Intel XE#1607])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][169] -> [ABORT][170] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#944]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][172] -> [DMESG-WARN][173] ([Intel XE#2953]) +3 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@xe_wedged@basic-wedged.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][174] ([Intel XE#1885]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][176] ([Intel XE#3249]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][178] ([Intel XE#827]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][180] ([Intel XE#1033]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][182] ([Intel XE#1033]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][184] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [SKIP][186] ([Intel XE#2423]) -> [PASS][187] +116 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][188] ([Intel XE#2291]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][190] ([Intel XE#1475]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][192] ([Intel XE#2882]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][194] ([Intel XE#3321]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [SKIP][196] ([Intel XE#2316]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - shard-lnl:          [FAIL][198] ([Intel XE#886]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][200] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][202] ([Intel XE#301]) -> [PASS][203] +3 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [DMESG-WARN][204] -> [PASS][205] +2 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][206] ([Intel XE#2136]) -> [PASS][207] +26 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][208] ([Intel XE#2446]) -> [PASS][209] +2 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         [DMESG-WARN][210] ([Intel XE#2953]) -> [PASS][211] +2 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][212] ([Intel XE#771] / [Intel XE#899]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][214] ([Intel XE#899]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][216] ([Intel XE#1130]) -> [PASS][217] +250 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][218] ([Intel XE#2423]) -> [SKIP][219] ([Intel XE#2233])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][220] ([Intel XE#873]) -> [SKIP][221] ([Intel XE#2423])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][222] ([Intel XE#3768]) -> [SKIP][223] ([Intel XE#2423])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][224] ([Intel XE#2370]) -> [SKIP][225] ([Intel XE#2423])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][226] ([Intel XE#2327]) -> [SKIP][227] ([Intel XE#2136]) +9 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][228] ([Intel XE#2136]) -> [SKIP][229] ([Intel XE#2327]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][230] ([Intel XE#2136]) -> [SKIP][231] ([Intel XE#2328])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][232] ([Intel XE#607]) -> [SKIP][233] ([Intel XE#2136])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][234] ([Intel XE#610]) -> [SKIP][235] ([Intel XE#2136]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][236] ([Intel XE#1124]) -> [SKIP][237] ([Intel XE#2136]) +14 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][238] ([Intel XE#2136]) -> [SKIP][239] ([Intel XE#1124]) +15 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][240] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][241] ([Intel XE#2423])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][242] ([Intel XE#367]) -> [SKIP][243] ([Intel XE#2423]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][244] ([Intel XE#2423]) -> [SKIP][245] ([Intel XE#367]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][246] ([Intel XE#2887]) -> [SKIP][247] ([Intel XE#2136]) +19 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][248] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][249] ([Intel XE#2136]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][250] ([Intel XE#3432]) -> [SKIP][251] ([Intel XE#2136]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][252] ([Intel XE#2136]) -> [SKIP][253] ([Intel XE#3432]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][254] ([Intel XE#2136]) -> [SKIP][255] ([Intel XE#2652] / [Intel XE#787])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][256] ([Intel XE#2136]) -> [SKIP][257] ([Intel XE#2887]) +22 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][258] ([Intel XE#2325]) -> [SKIP][259] ([Intel XE#2423]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_chamelium_color@degamma.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][260] ([Intel XE#2423]) -> [SKIP][261] ([Intel XE#2325]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_chamelium_color@gamma.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][262] ([Intel XE#2423]) -> [SKIP][263] ([Intel XE#2252]) +14 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][264] ([Intel XE#2252]) -> [SKIP][265] ([Intel XE#2423]) +15 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][266] ([Intel XE#2423]) -> [FAIL][267] ([Intel XE#1178])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][268] ([Intel XE#2423]) -> [SKIP][269] ([Intel XE#2390]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][270] ([Intel XE#1178]) -> [SKIP][271] ([Intel XE#2423]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_content_protection@legacy.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][272] ([Intel XE#2423]) -> [SKIP][273] ([Intel XE#2341])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_content_protection@type1.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][274] ([Intel XE#2320]) -> [SKIP][275] ([Intel XE#2423]) +6 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][276] ([Intel XE#2423]) -> [SKIP][277] ([Intel XE#2320]) +6 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][278] ([Intel XE#2423]) -> [SKIP][279] ([Intel XE#2321]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][280] ([Intel XE#2321]) -> [SKIP][281] ([Intel XE#2423]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][282] ([Intel XE#2291]) -> [SKIP][283] ([Intel XE#2423]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][284] ([Intel XE#2286]) -> [SKIP][285] ([Intel XE#2423])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][286] ([Intel XE#2291]) -> [DMESG-WARN][287] ([Intel XE#877])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][288] ([Intel XE#1508]) -> [SKIP][289] ([Intel XE#2136])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][290] ([Intel XE#2141]) -> [SKIP][291] ([Intel XE#2136])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][292] ([Intel XE#2136]) -> [SKIP][293] ([Intel XE#1508])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][294] ([Intel XE#2244]) -> [SKIP][295] ([Intel XE#2136]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_dsc@dsc-basic.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][296] ([Intel XE#2136]) -> [SKIP][297] ([Intel XE#2244])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][298] ([Intel XE#2136]) -> [FAIL][299] ([Intel XE#1695])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][300] ([Intel XE#2136]) -> [SKIP][301] ([Intel XE#776]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][302] ([Intel XE#2423]) -> [SKIP][303] ([Intel XE#2373])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#1138])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][306] ([Intel XE#2374]) -> [SKIP][307] ([Intel XE#2423])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][308] ([Intel XE#2423]) -> [SKIP][309] ([Intel XE#2316]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][310] ([Intel XE#2316]) -> [SKIP][311] ([Intel XE#2423]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][312] ([Intel XE#2136]) -> [SKIP][313] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][314] ([Intel XE#2380]) -> [SKIP][315] ([Intel XE#2136])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][316] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][317] ([Intel XE#2136]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][318] ([Intel XE#2311]) -> [SKIP][319] ([Intel XE#2136]) +35 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][320] ([Intel XE#2312]) -> [SKIP][321] ([Intel XE#2311]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][322] ([Intel XE#2136]) -> [SKIP][323] ([Intel XE#2312]) +10 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][324] ([Intel XE#2333]) -> [SKIP][325] ([Intel XE#2136]) +20 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][326] ([Intel XE#2136]) -> [FAIL][327] ([Intel XE#2333]) +14 other tests fail
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][328] ([Intel XE#2311]) -> [SKIP][329] ([Intel XE#2312])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][330] ([Intel XE#2312]) -> [SKIP][331] ([Intel XE#2136]) +23 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][332] ([Intel XE#2136]) -> [SKIP][333] ([Intel XE#2311]) +36 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][334] ([Intel XE#2313]) -> [SKIP][335] ([Intel XE#2136]) +33 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][336] ([Intel XE#2312]) -> [SKIP][337] ([Intel XE#2313]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][338] ([Intel XE#2136]) -> [SKIP][339] ([Intel XE#2136] / [Intel XE#2231]) +10 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#2352]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#2136]) -> [SKIP][343] ([Intel XE#2313]) +36 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][344] ([Intel XE#2423]) -> [SKIP][345] ([Intel XE#2340])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][346] ([Intel XE#2136]) -> [SKIP][347] ([Intel XE#2934])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][348] ([Intel XE#2927]) -> [SKIP][349] ([Intel XE#2136])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][350] ([Intel XE#2136]) -> [SKIP][351] ([Intel XE#346])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][352] ([Intel XE#2486]) -> [SKIP][353] ([Intel XE#2423])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][354] ([Intel XE#2423]) -> [SKIP][355] ([Intel XE#2393])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][356] ([Intel XE#2393]) -> [SKIP][357] ([Intel XE#2423])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][358] ([Intel XE#2493]) -> [SKIP][359] ([Intel XE#2423])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-bmg:          [SKIP][360] ([Intel XE#2763]) -> [SKIP][361] ([Intel XE#2423]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][362] ([Intel XE#2423]) -> [SKIP][363] ([Intel XE#2763]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][364] ([Intel XE#2136]) -> [SKIP][365] ([Intel XE#870]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][366] ([Intel XE#2938]) -> [SKIP][367] ([Intel XE#2136])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][368] ([Intel XE#2136]) -> [SKIP][369] ([Intel XE#3309])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][370] ([Intel XE#2136]) -> [FAIL][371] ([Intel XE#1430])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][372] ([Intel XE#2392]) -> [SKIP][373] ([Intel XE#2136])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][374] ([Intel XE#2446]) -> [SKIP][375] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][376] ([Intel XE#1489]) -> [SKIP][377] ([Intel XE#2136]) +9 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][378] ([Intel XE#2136]) -> [SKIP][379] ([Intel XE#1489]) +9 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][380] ([Intel XE#2136]) -> [SKIP][381] ([Intel XE#2387])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][382] ([Intel XE#2387]) -> [SKIP][383] ([Intel XE#2136]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][384] ([Intel XE#2136]) -> [SKIP][385] ([Intel XE#2234] / [Intel XE#2850]) +20 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][386] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][387] ([Intel XE#2136]) +19 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][388] ([Intel XE#2423]) -> [SKIP][389] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][390] ([Intel XE#2330]) -> [SKIP][391] ([Intel XE#2423])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][392] ([Intel XE#2413]) -> [SKIP][393] ([Intel XE#2423]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][394] ([Intel XE#2423]) -> [SKIP][395] ([Intel XE#3007]) +11 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_sequence@get-idle.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_sequence@get-idle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][396] ([Intel XE#1729]) -> [SKIP][397] ([Intel XE#362])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][398] ([Intel XE#2426]) -> [SKIP][399] ([Intel XE#2423])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][400] ([Intel XE#2423]) -> [SKIP][401] ([Intel XE#2168])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_vrr@lobf.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][402] ([Intel XE#1499]) -> [SKIP][403] ([Intel XE#2423]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_vrr@max-min.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][404] ([Intel XE#2423]) -> [SKIP][405] ([Intel XE#756])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][406] ([Intel XE#756]) -> [SKIP][407] ([Intel XE#2423])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][408] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][409] ([Intel XE#2423])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][410] ([Intel XE#1130]) -> [SKIP][411] ([Intel XE#3889]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          [SKIP][412] ([Intel XE#3889]) -> [SKIP][413] ([Intel XE#1130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          [SKIP][414] ([Intel XE#1130]) -> [SKIP][415] ([Intel XE#2905]) +10 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@xe_eudebug@read-metadata.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][416] ([Intel XE#2905]) -> [SKIP][417] ([Intel XE#1130]) +15 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][418] ([Intel XE#2322]) -> [SKIP][419] ([Intel XE#1130]) +12 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][420] ([Intel XE#1130]) -> [SKIP][421] ([Intel XE#2322]) +10 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][422] ([Intel XE#586]) -> [SKIP][423] ([Intel XE#1130])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_mmap@small-bar.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][424] ([Intel XE#1130]) -> [SKIP][425] ([Intel XE#2248])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][426] ([Intel XE#2236]) -> [SKIP][427] ([Intel XE#1130])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][428] ([Intel XE#2284]) -> [SKIP][429] ([Intel XE#1130])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][430] ([Intel XE#1130]) -> [SKIP][431] ([Intel XE#944]) +6 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_query@multigpu-query-config.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][432] ([Intel XE#944]) -> [SKIP][433] ([Intel XE#1130]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_query@multigpu-query-cs-cycles.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][434] -> [SKIP][435] ([Intel XE#1130])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 -> xe-pw-143695v1

  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4: 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4
  xe-pw-143695v1: 143695v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/index.html

--===============8080218259189009621==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc_wl: Introduce debugfs interface=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143695/">https://patchwork.freedesktop.org/series/143695/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143695v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143695v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8=
fc837f4_full -&gt; xe-pw-143695v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143695v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143695v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1436=
95v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-463/igt@core_h=
otunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@core_hotunplug=
@hotreplug-lateclose.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-=
bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a></=
li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling}:<u=
l>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43695v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2510-4fc988de9f5e17d19edb5fc0a=
0fbc15a8fc837f4_full and xe-pw-143695v1_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-6:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143695v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@core_hot=
unplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@core_hotunplug@hotrebind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@core_hotunplug@hotunplug-resc=
an.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@core_set=
master@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@core_setmaster@ma=
ster-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@fbdev@pa=
n.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143695v1/shard-bmg-1/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/sha=
rd-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-=
a-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-9/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp=
-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">I=
ntel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-=
bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_big_=
fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_big_fb@linear-=
16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-a=
spect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscre=
en-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rando=
m-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_display_modes@mst-exten=
ded-mode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_flip@2x-flip-=
vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@basic-flip-=
vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@kms_flip=
@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@f=
lip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@b-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_flip@fl=
ip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-=
interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +2 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_pm_r=
pm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_prop=
erties@connector-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_proper=
ties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +118 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_drm_f=
dinfo@utilization-single-full-load-isolation.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/ig=
t@xe_drm_fdinfo@utilization-single-full-load-isolation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +261 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_eudebug@read-metadata.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_eudebug_online@resume-ds=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exe=
c-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_li=
ve_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 =
other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc8=
37f4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a=
8fc837f4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fb=
c15a8fc837f4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0=
a0fbc15a8fc837f4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb=
5fc0a0fbc15a8fc837f4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d1=
9edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e=
17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de=
9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc9=
88de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-=
4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143695v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143695v1/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143695v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143695v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143695v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143695v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143695v1/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@xe_oa@disabled-read-error.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-8/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143695v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-4/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143695v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@xe_query@multigpu-query-inv=
alid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@xe_wedg=
ed@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143695v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2953">Intel XE#2953</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@core_hot=
unplug@hotunplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@core_ho=
tunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@core_set=
master@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@cor=
e_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE=
#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143695v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@=
pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-9/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143695v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d=
-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-4/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
95v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143695v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_curs=
or_crc@cursor-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_curso=
r_crc@cursor-suspend.html">PASS</a> +116 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-1/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel=
 XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143695v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interru=
ptible@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard=
-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-rmfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-4/igt@kms_flip@2x-fl=
ip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-2/igt@kms_flip=
@flip-vs-absolute-wf_vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-4/ig=
t@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/sha=
rd-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463=
/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-lnl-5/igt@kms_fro=
ntbuffer_tracking@fbcpsr-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_d=
c@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_pm_dc@d=
c5-dpms-negative.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-1/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-180.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/s=
hard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@kms_uni=
versal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-adl=
p-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-adlp-2/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard=
-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/sha=
rd-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS=
</a> +250 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-=
6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_asyn=
c_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/i=
gt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143695v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1=
/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@km=
s_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/=
shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143695v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_bw@l=
inear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/ig=
t@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_bw@l=
inear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-=
1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/sha=
rd-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bm=
g-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-b=
mg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE=
#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg=
-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_cham=
elium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_chamelium=
_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shar=
d-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">In=
tel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@k=
ms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_curs=
or_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-b=
mg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#228=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
695v1/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varyi=
ng-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143695v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_dirty=
fb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_dsc@=
dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_dsc@dsc-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_fbcon_fbt=
@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/s=
hard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/i=
gt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143695v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bp=
p-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143695v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
695v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
95v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143695v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
95v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
95v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2333">Intel XE#2333</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143695v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cu=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143695v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +36=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43695v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43695v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
95v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_getf=
b@getfb2-accept-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@kms_getfb@g=
etfb2-accept-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms=
_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_pane=
l_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_plan=
e_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
695v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscal=
e-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
95v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_p=
m_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_pm_d=
c@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_pm_d=
c@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_pm_dc@dc6-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_pm_rpm@mode=
set-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shar=
d-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-b=
mg-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-2/igt@kms_=
psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +=
20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_psr@=
psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@k=
ms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_r=
otation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-=
7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/=
igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_sequ=
ence@get-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@kms_sequence@get-=
idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3007">Intel XE#3007</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143695v1/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@kms_writ=
eback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@kms_write=
back@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@kms_writ=
eback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@kms=
_writeback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@sriov_ba=
sic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shar=
d-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_eudeb=
ug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/i=
gt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_eudeb=
ug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg=
-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-7/igt@xe_eudeb=
ug@read-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/igt@xe_eudebug@rea=
d-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-8/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-=
7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-3/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_mmap@small-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-8/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-3/igt@xe_pm@d3=
cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-1/igt@xe_pm@d3cold-m=
map-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-1/igt@xe_query=
@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-5/igt@xe_query=
@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_quer=
y@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/shard-bmg-6/igt@xe_sriov=
_auto_provisioning@exclusive-ranges.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/shard-bmg-7/igt@xe_sriov_=
auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 -&gt; xe-pw-143=
695v1</li>
</ul>
<p>IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4: 4fc988de9f5e17d19edb5fc=
0a0fbc15a8fc837f4<br />
  xe-pw-143695v1: 143695v1</p>

</body>
</html>

--===============8080218259189009621==--
