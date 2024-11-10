Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C063D5E39B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 03:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4F10E135;
	Sun, 10 Nov 2024 03:58:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E26710E05A;
 Sun, 10 Nov 2024 03:58:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0936825557347434248=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Support_capture_and_d?=
 =?utf-8?q?ump_of_devcoredump_for_general_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 10 Nov 2024 03:58:28 -0000
Message-ID: <173121110837.2009054.11963109413223279435@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

--===============0936825557347434248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Support capture and dump of devcoredump for general debug
URL   : https://patchwork.freedesktop.org/series/141122/
State : failure

== Summary ==

CI Bug Log - changes from xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c_full -> xe-pw-141122v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141122v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141122v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141122v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#3309]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#2423] / [i915#2575]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][7] ([Intel XE#1962]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#1130]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5}:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] +4 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html

  
Known issues
------------

  Here are the changes found in xe-pw-141122v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1885]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1885])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#2134]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@fbdev@read.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2550]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [PASS][18] -> [DMESG-WARN][19] ([Intel XE#3086])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-3/igt@kms_atomic_transition@modeset-transition.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-3/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#1701]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +97 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2890]) +35 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195] / [Intel XE#3113]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#3304])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2423] / [i915#2575]) +24 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1188])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#1541])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([i915#3804])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2351])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#2882]) +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#301])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#301])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#886]) +4 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#2423] / [i915#2575]) +127 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_flip@busy-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2597]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#2932]) +3 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2890]) +33 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2351] / [Intel XE#2890]) +15 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2351] / [Intel XE#2890]) +15 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#455])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#616]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#2763]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2446])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#2446]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#899]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#1130]) +211 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][67] -> [TIMEOUT][68] ([Intel XE#1473])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#1630]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#1630]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1130]) +58 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3184])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][76] -> [FAIL][77] ([Intel XE#2136])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_module_load@many-reload.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#1173])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][79] -> [ABORT][80] ([Intel XE#1358] / [Intel XE#1607])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-8/igt@xe_pm@s4-basic.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][81] -> [ABORT][82] ([Intel XE#1794])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#958])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@core_getversion@all-cards.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#2134]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@fbdev@nullptr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][91] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][93] ([Intel XE#3194]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:
    - shard-adlp:         [DMESG-WARN][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][97] ([Intel XE#1426]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][99] ([Intel XE#1426]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][102] +3 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#3086]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-1/igt@kms_cursor_crc@cursor-random-128x42.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][105] ([Intel XE#877]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][107] ([Intel XE#1541]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][109] ([Intel XE#301]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [FAIL][111] ([Intel XE#2882]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][113] ([Intel XE#886]) -> [PASS][114] +3 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x:
    - shard-lnl:          [FAIL][115] ([Intel XE#1491]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#2890]) -> [PASS][118] +21 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#2423] / [i915#2575]) -> [PASS][120] +55 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#2446]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_pm_rpm@cursor.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][123] ([Intel XE#2042]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [DMESG-WARN][125] ([Intel XE#2932]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-59.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr@psr2-primary-page-flip@edp-1:
    - shard-lnl:          [FAIL][127] ([Intel XE#2808]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-6/igt@kms_psr@psr2-primary-page-flip@edp-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-4/igt@kms_psr@psr2-primary-page-flip@edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#2423]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@testdisplay.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@testdisplay.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][131] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][133] ([Intel XE#1630]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][135] ([Intel XE#1630]) -> [PASS][136] +2 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][137] ([Intel XE#3320]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1130]) -> [PASS][140] +105 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#316]) -> [SKIP][142] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][144] ([Intel XE#316]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#316]) -> [SKIP][146] ([Intel XE#2890]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [INCOMPLETE][147] ([Intel XE#1195] / [Intel XE#3225]) -> [SKIP][148] ([Intel XE#2890])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#2890]) -> [SKIP][150] ([Intel XE#316])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][151] -> [FAIL][152] ([Intel XE#1231] / [Intel XE#1242])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1124]) -> [SKIP][154] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1124]) -> [SKIP][156] ([Intel XE#2890]) +10 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][158] ([Intel XE#1124])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][160] ([Intel XE#619]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2890]) -> [SKIP][162] ([Intel XE#610])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#2890]) -> [SKIP][164] ([Intel XE#1124]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#367]) -> [SKIP][166] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2423] / [i915#2575]) -> [SKIP][168] ([Intel XE#2191])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#2191]) -> [SKIP][170] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#2423] / [i915#2575]) -> [SKIP][172] ([Intel XE#367]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2890]) -> [SKIP][174] ([Intel XE#2907]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][176] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][178] ([Intel XE#2890]) +12 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][179] ([Intel XE#616]) -> [SKIP][180] ([Intel XE#2890])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][182] ([Intel XE#2890])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2890]) -> [INCOMPLETE][184] ([Intel XE#1195] / [Intel XE#1727])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2907]) -> [SKIP][186] ([Intel XE#2890]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2890]) -> [SKIP][188] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2423] / [i915#2575]) -> [SKIP][190] ([Intel XE#306])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#306]) -> [SKIP][192] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#373]) -> [SKIP][194] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2423] / [i915#2575]) -> [SKIP][196] ([Intel XE#373]) +8 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#1178]) -> [SKIP][198] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#307]) -> [SKIP][200] ([Intel XE#2423] / [i915#2575])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2423] / [i915#2575]) -> [FAIL][202] ([Intel XE#1178]) +1 other test fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2423] / [i915#2575]) -> [SKIP][204] ([Intel XE#455]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#308]) -> [SKIP][206] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#323]) -> [SKIP][208] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2423] / [i915#2575]) -> [SKIP][210] ([Intel XE#323])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#455]) -> [SKIP][212] ([Intel XE#2351] / [Intel XE#2890])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#703]) -> [SKIP][214] ([Intel XE#2423] / [i915#2575])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2423] / [i915#2575]) -> [SKIP][216] ([Intel XE#1135])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_feature_discovery@psr2.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][217] ([Intel XE#301]) -> [SKIP][218] ([Intel XE#2423] / [i915#2575])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#455]) -> [SKIP][220] ([Intel XE#2890]) +7 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][222] ([Intel XE#455])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2890]) -> [SKIP][224] ([Intel XE#455]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#651]) -> [SKIP][226] ([Intel XE#2890]) +26 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][228] ([Intel XE#651]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2890]) -> [SKIP][230] ([Intel XE#651]) +18 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#651]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#2890]) +13 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2890]) -> [SKIP][234] ([Intel XE#653]) +19 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#653]) -> [SKIP][236] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#658]) -> [SKIP][238] ([Intel XE#2351] / [Intel XE#2890])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#653]) -> [SKIP][240] ([Intel XE#2890]) +36 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][242] ([Intel XE#653]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2925]) -> [SKIP][244] ([Intel XE#2890])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#455]) -> [SKIP][246] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][247] ([Intel XE#361]) -> [SKIP][248] ([Intel XE#2423] / [i915#2575])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423] / [i915#2575]) -> [SKIP][250] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2890]) -> [SKIP][254] ([Intel XE#870])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#870]) -> [SKIP][256] ([Intel XE#2890])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][258] ([Intel XE#908])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2890]) -> [SKIP][260] ([Intel XE#1489]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1489]) -> [SKIP][262] ([Intel XE#2890]) +10 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1122]) -> [SKIP][264] ([Intel XE#2890])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2890]) -> [SKIP][266] ([Intel XE#1122])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2890]) -> [SKIP][268] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][270] ([Intel XE#2351] / [Intel XE#2890]) +6 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][272] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][274] ([Intel XE#2890]) +14 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][276] ([Intel XE#2351])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_psr@psr-primary-page-flip.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1127]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][279] -> [SKIP][280] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][281] ([Intel XE#1729]) -> [SKIP][282] ([Intel XE#362])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#362]) -> [SKIP][284] ([Intel XE#1500])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#330]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][288] ([Intel XE#2168])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_vrr@cmrr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2168]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_vrr@lobf.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [SKIP][292] ([Intel XE#756])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#1091] / [Intel XE#2849])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][296] ([Intel XE#1130]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1123]) -> [SKIP][298] ([Intel XE#1130])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1130]) -> [SKIP][300] ([Intel XE#1126])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1126]) -> [SKIP][302] ([Intel XE#1130])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1130]) -> [SKIP][304] ([Intel XE#2905]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@single-step:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2905]) -> [SKIP][306] ([Intel XE#1130]) +13 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_eudebug_online@single-step.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][307] ([Intel XE#1600]) -> [SKIP][308] ([Intel XE#1130])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1130]) -> [SKIP][310] ([Intel XE#288]) +20 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#288]) -> [SKIP][312] ([Intel XE#1130]) +37 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1130]) -> [SKIP][314] ([Intel XE#2360])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1130]) -> [SKIP][316] ([Intel XE#560])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#512]) -> [SKIP][318] ([Intel XE#1130])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_mmap@small-bar.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1130]) -> [SKIP][320] ([Intel XE#2541]) +5 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_oa@mmio-triggered-reports.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2541]) -> [SKIP][322] ([Intel XE#1130]) +8 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_oa@polling-small-buf.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1130]) -> [SKIP][324] ([Intel XE#1337])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1061]) -> [FAIL][326] ([Intel XE#1173])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_peer2peer@write.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2284]) -> [SKIP][328] ([Intel XE#1130])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][330] ([Intel XE#1130]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1130]) -> [SKIP][332] ([Intel XE#2284] / [Intel XE#366])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#944]) -> [SKIP][334] ([Intel XE#1130]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1130]) -> [SKIP][336] ([Intel XE#944])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_query@multigpu-query-invalid-size.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1130]) -> [ABORT][338] ([Intel XE#3075] / [Intel XE#3084])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#3403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c -> xe-pw-141122v1

  IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c: 00976833a8b163cfcad247ba2d22ea4819fd749c
  xe-pw-141122v1: 141122v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/index.html

--===============0936825557347434248==
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
<tr><td><b>Series:</b></td><td>drm/xe: Support capture and dump of devcoredump for general debug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141122/">https://patchwork.freedesktop.org/series/141122/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c_full -&gt; xe-pw-141122v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141122v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141122v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141122v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-suspend:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5}:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141122v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-3/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-3/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-432/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +211 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-1/igt@kms_cursor_crc@cursor-random-128x42.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +55 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_pm_rpm@cursor.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-6/igt@kms_psr@psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-4/igt@kms_psr@psr2-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@testdisplay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +105 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-435/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-433/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141122v1/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c -&gt; xe-pw-141122v1</li>
</ul>
<p>IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c: 00976833a8b163cfcad247ba2d22ea4819fd749c<br />
  xe-pw-141122v1: 141122v1</p>

</body>
</html>

--===============0936825557347434248==--
