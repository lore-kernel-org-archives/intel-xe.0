Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70539D65C7C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 11:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B7310E7E8;
	Thu, 14 Nov 2024 11:51:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D324310E7E8;
 Thu, 14 Nov 2024 11:51:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8755998015221192034=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pmu=3A_PMU_interface_for?=
 =?utf-8?q?_Xe_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 11:51:32 -0000
Message-ID: <173158509284.4043894.11018694709746611484@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113232700.151910-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241113232700.151910-1-vinay.belgaumkar@intel.com>
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

--===============8755998015221192034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: PMU interface for Xe (rev7)
URL   : https://patchwork.freedesktop.org/series/139121/
State : failure

== Summary ==

CI Bug Log - changes from xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70_full -> xe-pw-139121v7_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139121v7_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139121v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139121v7_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +5 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@torture-move@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-c.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][6] -> [FAIL][7] +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@modeset-vs-vblank-race@b-edp1:
    - shard-lnl:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#3309]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  
Known issues
------------

  Here are the changes found in xe-pw-139121v7_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#1885])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][18] -> [FAIL][19] ([Intel XE#3130] / [Intel XE#3249])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2423])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@core_setmaster_vs_auth.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@core_setmaster_vs_auth.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#2136]) +15 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#316]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#877])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#3052])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][30] ([Intel XE#324])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][31] ([Intel XE#324])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#367]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +84 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#787]) +14 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#1727])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1195] / [Intel XE#3113])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#307])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#1188])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-5.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#308])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2423] / [i915#2575]) +50 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#2577]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#877])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#309]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1475])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#1541])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#455]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1135])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#310]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#2882])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#886]) +7 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-lnl:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2049])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_flip@modeset-vs-vblank-race.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2380]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#455]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#651]) +10 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][81] ([Intel XE#1861])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#651])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2136]) +15 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2313]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#653]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#653]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#656]) +20 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][91] ([Intel XE#1035] / [Intel XE#1195])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][92] ([Intel XE#2078]) +1 other test warn
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][93] -> [FAIL][94] ([Intel XE#1874])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2493])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2763]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#1430])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2446])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#2446])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#2932])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#836])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2042])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
    - shard-lnl:          [PASS][108] -> [DMESG-WARN][109] ([Intel XE#3184]) +1 other test dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1489]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1489])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2850] / [Intel XE#929])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2234] / [Intel XE#2850])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#2808]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_psr@psr-primary-page-flip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2330])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1127])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2168]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#756])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1126])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2905])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2905])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2905]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][128] ([Intel XE#1473])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][129] ([Intel XE#1473])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#688])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#1130]) +89 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1392]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1130]) +28 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#288]) +12 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#288]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2833])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@enable-disable:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#2541]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_oa@enable-disable.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2541]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][140] ([Intel XE#2249])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#2284] / [Intel XE#366])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][142] ([Intel XE#3184])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][143] -> [ABORT][144] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@xe_pm@s4-basic-exec.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][145] -> [ABORT][146] ([Intel XE#1358] / [Intel XE#1607])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][147] -> [ABORT][148] ([Intel XE#1607] / [Intel XE#1794])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#944])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#944])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#3440]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_getversion@all-cards.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1885]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2134]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@fbdev@nullptr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@fbdev@nullptr.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [FAIL][157] ([Intel XE#1874]) -> [PASS][158] +2 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_async_flips@crc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-1/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][159] ([Intel XE#1701]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [TIMEOUT][161] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][163] ([Intel XE#3086]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][167] ([Intel XE#1195] / [Intel XE#3226]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-lnl:          [DMESG-WARN][169] -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#301]) -> [PASS][172] +6 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2423] / [i915#2575]) -> [PASS][174] +39 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html
    - shard-lnl:          [FAIL][175] ([Intel XE#886]) -> [PASS][176] +6 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][177] -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [FAIL][179] ([Intel XE#2882]) -> [PASS][180] +3 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][181] ([Intel XE#3403] / [Intel XE#886]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2136]) -> [PASS][184] +15 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#455]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][189] ([Intel XE#1503]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2446]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-WARN][193] ([Intel XE#3184]) -> [PASS][194] +2 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [DMESG-WARN][195] ([Intel XE#2055]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-180.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vblank@query-idle:
    - shard-dg2-set2:     [FAIL][197] -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_vblank@query-idle.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-464/igt@kms_vblank@query-idle.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][199] ([Intel XE#1473]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][201] ([Intel XE#1473]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][203] ([Intel XE#1630]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][205] ([Intel XE#1794]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][207] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][209] ([Intel XE#1794]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - shard-adlp:         [TIMEOUT][211] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][212] +2 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@xe_pm_residency@gt-c6-on-idle.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][213] ([Intel XE#958]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1130]) -> [PASS][216] +74 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#623]) -> [SKIP][218] ([Intel XE#2423] / [i915#2575])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         [TIMEOUT][219] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [SKIP][220] ([Intel XE#1124])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#316]) -> [SKIP][222] ([Intel XE#2136]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][223] ([Intel XE#3194]) -> [FAIL][224] ([Intel XE#1231] / [Intel XE#1242])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][225] -> [FAIL][226] ([Intel XE#1231] / [Intel XE#1242])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][228] ([Intel XE#1124]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1124]) -> [SKIP][230] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1124]) -> [SKIP][232] ([Intel XE#2136]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#619]) -> [SKIP][234] ([Intel XE#2136] / [Intel XE#2351])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#607]) -> [SKIP][236] ([Intel XE#2136])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136]) -> [SKIP][238] ([Intel XE#1124]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2423] / [i915#2575]) -> [SKIP][240] ([Intel XE#367]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#367]) -> [SKIP][242] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136]) -> [SKIP][244] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][246] ([Intel XE#2136] / [Intel XE#2351])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2907]) -> [SKIP][248] ([Intel XE#2136]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][249] -> [SKIP][250] ([Intel XE#455] / [Intel XE#787])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][252] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][254] ([Intel XE#2136]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#306]) -> [SKIP][256] ([Intel XE#2423] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_chamelium_color@degamma.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#373]) -> [SKIP][258] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2423] / [i915#2575]) -> [SKIP][260] ([Intel XE#373]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [SKIP][262] ([Intel XE#307])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][263] ([Intel XE#1178]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_content_protection@legacy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#455]) -> [SKIP][266] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_content_protection@mei-interface.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2423] / [i915#2575]) -> [FAIL][268] ([Intel XE#1188])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@uevent.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [SKIP][270] ([Intel XE#308])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#308]) -> [SKIP][272] ([Intel XE#2423] / [i915#2575])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][274] ([Intel XE#3184])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_legacy@torture-move.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2351]) -> [SKIP][276] ([Intel XE#455])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#455]) -> [SKIP][278] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         [TIMEOUT][279] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][280] ([Intel XE#776])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_fbcon_fbt@psr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2423] / [i915#2575]) -> [SKIP][282] ([Intel XE#701])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#455]) -> [SKIP][284] ([Intel XE#2136])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#455]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][287] ([Intel XE#3194]) -> [DMESG-FAIL][288] ([Intel XE#324]) +5 other tests dmesg-fail
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#651]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][291] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][292] ([Intel XE#1861])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#658]) -> [SKIP][294] ([Intel XE#2136] / [Intel XE#2351])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#651]) -> [SKIP][296] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#651]) -> [SKIP][298] ([Intel XE#2136]) +15 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][300] ([Intel XE#651]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#653]) -> [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#653]) -> [SKIP][304] ([Intel XE#2136]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#653]) +11 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][308] ([Intel XE#653]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [FAIL][309] ([Intel XE#3312] / [Intel XE#3404]) -> [SKIP][310] ([Intel XE#2423] / [i915#2575])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][311] ([Intel XE#1035]) -> [INCOMPLETE][312] ([Intel XE#1035] / [Intel XE#1195])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_plane@pixel-format.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2423] / [i915#2575]) -> [SKIP][314] ([Intel XE#455]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#870])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136]) -> [SKIP][320] ([Intel XE#2938])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#908]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][323] ([Intel XE#734]) -> [FAIL][324] ([Intel XE#3325])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1489]) -> [SKIP][326] ([Intel XE#2136]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#1489]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][332] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][334] ([Intel XE#2136] / [Intel XE#2351])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][336] ([Intel XE#2136]) +6 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#3414]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#362]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][341] ([Intel XE#2509]) -> [SKIP][342] ([Intel XE#2426])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#756]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2423] / [i915#2575]) -> [SKIP][346] ([Intel XE#756])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1123]) -> [SKIP][350] ([Intel XE#1130])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#1126])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2905]) -> [SKIP][354] ([Intel XE#1130]) +4 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_eudebug@basic-exec-queues.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1130]) -> [SKIP][356] ([Intel XE#2905]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#288]) -> [SKIP][358] ([Intel XE#1130]) +13 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1130]) -> [SKIP][360] ([Intel XE#288]) +11 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2360]) -> [SKIP][362] ([Intel XE#1130])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2541]) -> [SKIP][364] ([Intel XE#1130]) +5 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1130]) -> [SKIP][366] ([Intel XE#2541]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_oa@privileged-forked-access-vaddr.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1130]) -> [SKIP][368] ([Intel XE#944])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#944]) -> [SKIP][370] ([Intel XE#1130]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [ABORT][371] ([Intel XE#3421]) -> [SKIP][372] ([Intel XE#1130])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
  [Intel XE#3404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70 -> xe-pw-139121v7

  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70: d8d960b20b0dc59b06c24fc210387b9c158edf70
  xe-pw-139121v7: 139121v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/index.html

--===============8755998015221192034==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: PMU interface for Xe (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139121/">https://patchwork.freedesktop.org/series/139121/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70_full -&gt; xe-pw-139121v7_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139121v7_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139121v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139121v7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-c.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139121v7_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@core_setmaster_vs_auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@core_setmaster_vs_auth.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_flip@modeset-vs-vblank-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_psr@psr-primary-page-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-8/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_oa@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-1/igt@kms_async_flips@crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +39 other tests pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403">Intel XE#3403</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_vblank@query-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-464/igt@kms_vblank@query-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-3/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@xe_pm_residency@gt-c6-on-idle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html">PASS</a> +74 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_legacy@torture-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_fbcon_fbt@psr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v7/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70 -&gt; xe-pw-139121v7</li>
</ul>
<p>IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70: d8d960b20b0dc59b06c24fc210387b9c158edf70<br />
  xe-pw-139121v7: 139121v7</p>

</body>
</html>

--===============8755998015221192034==--
