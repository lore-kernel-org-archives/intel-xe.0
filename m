Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A1C02187
	for <intel-xe@archiver.kernel.org>; Sun, 19 Jan 2025 15:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2FE10E121;
	Sun, 19 Jan 2025 15:33:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089DE10E10A;
 Sun, 19 Jan 2025 15:33:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2167856968461674451=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Refactor_some_graphics_des?=
 =?utf-8?q?criptor_flags_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 19 Jan 2025 15:33:25 -0000
Message-ID: <173730080501.1596311.5814957937782659642@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
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

--===============2167856968461674451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor some graphics descriptor flags (rev2)
URL   : https://patchwork.freedesktop.org/series/143608/
State : failure

== Summary ==

CI Bug Log - changes from xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1_full -> xe-pw-143608v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143608v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143608v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143608v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@xe_pm@s2idle-mocs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@xe_pm@s2idle-mocs.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][6] ([Intel XE#2423]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][8] ([Intel XE#1130]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
Known issues
------------

  Here are the changes found in xe-pw-143608v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#1885]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@core_hotunplug@hotreplug.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3249])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3453])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@fbdev@info.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@fbdev@info.html

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2134])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#827])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#3908]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#3908]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#316])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2136]) +18 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +20 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#3862])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#877])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#323])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953]) +11 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#2882]) +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#3321])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#3098] / [Intel XE#4072])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2293]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][55] -> [DMESG-FAIL][56] ([Intel XE#1033]) +1 other test dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1874])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2136]) +38 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#653]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#616]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-436/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2423]) +97 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2763]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1129])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2446]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@kms_pm_rpm@cursor.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2446]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1489])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1127])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#899])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2423]) +26 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#3889])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2905]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1130]) +49 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_exec_basic@many-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#288]) +8 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2229]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2229])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#1999]) +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#378])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_module_load@force-load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1337])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][89] -> [ABORT][90] ([Intel XE#1358] / [Intel XE#1794])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][91] -> [ABORT][92] ([Intel XE#1358] / [Intel XE#1607])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#944]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#1130]) +214 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@xe_query@query-gt-list.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_query@query-gt-list.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][96] ([Intel XE#1885]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@core_hotunplug@hotrebind.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][98] ([Intel XE#3249]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][100] ([Intel XE#2134]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@fbdev@unaligned-write.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][102] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][104] ([Intel XE#3746] / [Intel XE#827]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][106] ([Intel XE#827]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1033]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][110] ([Intel XE#3908]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][112] ([Intel XE#2136]) -> [PASS][113] +22 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][114] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][116] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][118] ([Intel XE#3124]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-adlp:         [DMESG-WARN][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][122] ([Intel XE#877]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][124] ([Intel XE#2291]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][126] ([Intel XE#2882]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#2049]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][130] -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][132] ([Intel XE#2316]) -> [PASS][133] +2 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][134] ([Intel XE#886]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [FAIL][136] ([Intel XE#2882]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - shard-adlp:         [FAIL][138] ([Intel XE#886]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#301]) -> [PASS][141] +5 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [FAIL][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][146] ([Intel XE#2446]) -> [PASS][147] +3 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_pm_rpm@i2c.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][148] ([Intel XE#2423]) -> [PASS][149] +96 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][150] ([Intel XE#1435]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][152] ([Intel XE#771] / [Intel XE#899]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][154] ([Intel XE#899]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][156] ([Intel XE#2953]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][158] ([Intel XE#1130]) -> [PASS][159] +213 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][160] ([Intel XE#1033]) -> [DMESG-WARN][161] ([Intel XE#1033]) +1 other test dmesg-warn
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][162] ([Intel XE#827]) -> [DMESG-WARN][163] ([Intel XE#1033])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][164] ([Intel XE#2423]) -> [SKIP][165] ([Intel XE#873])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][166] ([Intel XE#3768]) -> [SKIP][167] ([Intel XE#2423])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][168] ([Intel XE#2370]) -> [SKIP][169] ([Intel XE#2423])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][170] ([Intel XE#2327]) -> [SKIP][171] ([Intel XE#2136]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][172] ([Intel XE#2136]) -> [SKIP][173] ([Intel XE#2327]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][174] ([Intel XE#1124]) -> [SKIP][175] ([Intel XE#2136]) +12 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][176] ([Intel XE#2136]) -> [SKIP][177] ([Intel XE#1124]) +11 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][178] ([Intel XE#610]) -> [SKIP][179] ([Intel XE#2136])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][180] ([Intel XE#2136]) -> [SKIP][181] ([Intel XE#610])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][182] ([Intel XE#2423]) -> [SKIP][183] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][184] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][185] ([Intel XE#2423])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][186] ([Intel XE#2423]) -> [SKIP][187] ([Intel XE#367]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][188] ([Intel XE#367]) -> [SKIP][189] ([Intel XE#2423]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][190] ([Intel XE#2136]) -> [SKIP][191] ([Intel XE#2887]) +22 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][192] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][193] ([Intel XE#2136]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][194] ([Intel XE#3432]) -> [SKIP][195] ([Intel XE#2136]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][196] ([Intel XE#2136]) -> [SKIP][197] ([Intel XE#3432])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][198] ([Intel XE#2887]) -> [SKIP][199] ([Intel XE#2136]) +16 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][200] ([Intel XE#2325]) -> [SKIP][201] ([Intel XE#2423]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][202] ([Intel XE#2423]) -> [SKIP][203] ([Intel XE#2325])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][204] ([Intel XE#2423]) -> [SKIP][205] ([Intel XE#2252]) +13 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][206] ([Intel XE#2252]) -> [SKIP][207] ([Intel XE#2423]) +10 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][208] ([Intel XE#2423]) -> [FAIL][209] ([Intel XE#1178]) +2 other tests fail
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_content_protection@atomic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][210] ([Intel XE#2341]) -> [SKIP][211] ([Intel XE#2423]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][212] ([Intel XE#2390]) -> [SKIP][213] ([Intel XE#2423])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][214] ([Intel XE#2320]) -> [SKIP][215] ([Intel XE#2423]) +4 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][216] ([Intel XE#2423]) -> [SKIP][217] ([Intel XE#2321]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][218] ([Intel XE#2423]) -> [SKIP][219] ([Intel XE#2320]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][220] ([Intel XE#2321]) -> [SKIP][221] ([Intel XE#2423]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][222] ([Intel XE#2286]) -> [SKIP][223] ([Intel XE#2423])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-bmg:          [INCOMPLETE][224] ([Intel XE#3226]) -> [SKIP][225] ([Intel XE#2423])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][226] ([Intel XE#2423]) -> [SKIP][227] ([Intel XE#2286])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][228] ([Intel XE#2136]) -> [SKIP][229] ([Intel XE#1508])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][230] ([Intel XE#3070]) -> [SKIP][231] ([Intel XE#2136])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][232] ([Intel XE#2244]) -> [SKIP][233] ([Intel XE#2136])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_dsc@dsc-basic.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][234] ([Intel XE#2136]) -> [SKIP][235] ([Intel XE#2244]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][236] ([Intel XE#2136]) -> [FAIL][237] ([Intel XE#1695])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][238] ([Intel XE#2423]) -> [SKIP][239] ([Intel XE#2372])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][240] ([Intel XE#2423]) -> [SKIP][241] ([Intel XE#2373])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][242] ([Intel XE#2374]) -> [SKIP][243] ([Intel XE#2423])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][244] ([Intel XE#2423]) -> [FAIL][245] ([Intel XE#2882]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][246] -> [FAIL][247] ([Intel XE#2882])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][248] ([Intel XE#2316]) -> [SKIP][249] ([Intel XE#2423]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][250] ([Intel XE#2136]) -> [SKIP][251] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][252] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][253] ([Intel XE#2136]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][254] ([Intel XE#2311]) -> [SKIP][255] ([Intel XE#2136]) +31 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][256] ([Intel XE#2311]) -> [SKIP][257] ([Intel XE#2312]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][258] ([Intel XE#2312]) -> [SKIP][259] ([Intel XE#2311]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [FAIL][260] ([Intel XE#2333]) -> [SKIP][261] ([Intel XE#2136]) +19 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][262] ([Intel XE#2333]) -> [SKIP][263] ([Intel XE#2312]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][264] ([Intel XE#2312]) -> [FAIL][265] ([Intel XE#2333])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][266] ([Intel XE#2136]) -> [FAIL][267] ([Intel XE#2333]) +21 other tests fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [SKIP][269] ([Intel XE#2136]) +8 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][270] ([Intel XE#2136]) -> [SKIP][271] ([Intel XE#2352])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][272] ([Intel XE#2136]) -> [SKIP][273] ([Intel XE#2311]) +37 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][274] ([Intel XE#2352]) -> [SKIP][275] ([Intel XE#2136])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][276] ([Intel XE#2313]) -> [SKIP][277] ([Intel XE#2136]) +32 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][278] ([Intel XE#2313]) -> [SKIP][279] ([Intel XE#2312]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][280] ([Intel XE#2312]) -> [SKIP][281] ([Intel XE#2313]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][282] ([Intel XE#2136]) -> [SKIP][283] ([Intel XE#2313]) +35 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][284] ([Intel XE#346]) -> [SKIP][285] ([Intel XE#2136])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][286] ([Intel XE#2136]) -> [SKIP][287] ([Intel XE#2927])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][288] ([Intel XE#2423]) -> [SKIP][289] ([Intel XE#2486])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_panel_fitting@legacy.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][290] ([Intel XE#2393]) -> [SKIP][291] ([Intel XE#2423])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][292] ([Intel XE#2493]) -> [SKIP][293] ([Intel XE#2423])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][294] ([Intel XE#2423]) -> [SKIP][295] ([Intel XE#2493])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][296] ([Intel XE#2423]) -> [SKIP][297] ([Intel XE#2763]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          [SKIP][298] ([Intel XE#2763]) -> [SKIP][299] ([Intel XE#2423]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][300] ([Intel XE#2938]) -> [SKIP][301] ([Intel XE#2136])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][302] ([Intel XE#2136]) -> [SKIP][303] ([Intel XE#870])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][304] ([Intel XE#2392]) -> [SKIP][305] ([Intel XE#2136])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][306] ([Intel XE#2505]) -> [SKIP][307] ([Intel XE#2136])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][308] ([Intel XE#2499]) -> [SKIP][309] ([Intel XE#2136])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][310] ([Intel XE#2446]) -> [SKIP][311] ([Intel XE#1439] / [Intel XE#836])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][312] ([Intel XE#2136]) -> [SKIP][313] ([Intel XE#1489]) +7 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][314] ([Intel XE#1489]) -> [SKIP][315] ([Intel XE#2136]) +11 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][316] ([Intel XE#2387]) -> [SKIP][317] ([Intel XE#2136])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][318] ([Intel XE#2136]) -> [SKIP][319] ([Intel XE#2387]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][320] ([Intel XE#2136]) -> [SKIP][321] ([Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][322] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][323] ([Intel XE#2136]) +17 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][324] ([Intel XE#2136]) -> [SKIP][325] ([Intel XE#2414])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][326] ([Intel XE#2423]) -> [SKIP][327] ([Intel XE#3414] / [Intel XE#3904])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][328] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][329] ([Intel XE#2423])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][330] ([Intel XE#2413]) -> [SKIP][331] ([Intel XE#2423]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][332] ([Intel XE#1435]) -> [SKIP][333] ([Intel XE#2423])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][334] ([Intel XE#2426]) -> [SKIP][335] ([Intel XE#2423])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#362]) -> [SKIP][337] ([Intel XE#1500])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][338] ([Intel XE#2423]) -> [SKIP][339] ([Intel XE#2450])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][340] ([Intel XE#2423]) -> [SKIP][341] ([Intel XE#1499]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_vrr@max-min.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][342] ([Intel XE#1499]) -> [SKIP][343] ([Intel XE#2423]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][344] ([Intel XE#2423]) -> [SKIP][345] ([Intel XE#756])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][346] ([Intel XE#2423]) -> [SKIP][347] ([Intel XE#1091] / [Intel XE#2849])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][348] ([Intel XE#1130]) -> [SKIP][349] ([Intel XE#2905]) +10 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-discovery.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][350] ([Intel XE#2905]) -> [SKIP][351] ([Intel XE#1130]) +15 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][352] ([Intel XE#1130]) -> [SKIP][353] ([Intel XE#3889]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          [SKIP][354] ([Intel XE#1130]) -> [SKIP][355] ([Intel XE#2322]) +9 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][356] ([Intel XE#2322]) -> [SKIP][357] ([Intel XE#1130]) +12 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [INCOMPLETE][358] ([Intel XE#3592]) -> [SKIP][359] ([Intel XE#1130])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][360] ([Intel XE#2833]) -> [SKIP][361] ([Intel XE#1192])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][362] ([Intel XE#1130]) -> [SKIP][363] ([Intel XE#586])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_mmap@small-bar.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][364] ([Intel XE#1130]) -> [SKIP][365] ([Intel XE#2248])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][366] ([Intel XE#1420]) -> [SKIP][367] ([Intel XE#1130])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][368] ([Intel XE#1130]) -> [SKIP][369] ([Intel XE#2236])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][370] ([Intel XE#1130]) -> [SKIP][371] ([Intel XE#2284])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][372] ([Intel XE#2284]) -> [SKIP][373] ([Intel XE#1130]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][374] ([Intel XE#944]) -> [SKIP][375] ([Intel XE#1130]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][376] ([Intel XE#1130]) -> [SKIP][377] ([Intel XE#944]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_query@multigpu-query-gt-list.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4072
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
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

  * Linux: xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1 -> xe-pw-143608v2

  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1: f677c54c2a38bed0be21b9c3ff3b1164bfc962b1
  xe-pw-143608v2: 143608v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/index.html

--===============2167856968461674451==
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
<tr><td><b>Series:</b></td><td>Refactor some graphics descriptor flags (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143608/">https://patchwork.freedesktop.org/series/143608/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1_full -&gt; xe-pw-143608v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143608v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143608v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143608v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143608v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4072">Intel XE#4072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-436/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_exec_basic@many-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@xe_query@query-gt-list.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_query@query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +214 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@core_hotunplug@hotrebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746">Intel XE#3746</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-256x256.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_properties@connector-properties-legacy.html">PASS</a> +96 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +213 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592">Intel XE#3592</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1/shard-bmg-1/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v2/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1 -&gt; xe-pw-143608v2</li>
</ul>
<p>IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2512-f677c54c2a38bed0be21b9c3ff3b1164bfc962b1: f677c54c2a38bed0be21b9c3ff3b1164bfc962b1<br />
  xe-pw-143608v2: 143608v2</p>

</body>
</html>

--===============2167856968461674451==--
