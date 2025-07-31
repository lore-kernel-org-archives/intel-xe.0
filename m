Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8371C87FD2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 22:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DA710E7F5;
	Thu, 31 Jul 2025 22:00:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101010E2C8;
 Thu, 31 Jul 2025 22:00:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2514476693994706086=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pm=3A_Disable_RPM_f?=
 =?utf-8?q?or_SR-IOV_VFs_with_no_PCIe_PM_capability?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 22:00:16 -0000
Message-ID: <175399921651.203650.4699591522614082753@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731153251.18864-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250731153251.18864-1-satyanarayana.k.v.p@intel.com>
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

--===============2514476693994706086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM capability
URL   : https://patchwork.freedesktop.org/series/152366/
State : failure

== Summary ==

CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -> xe-pw-152366v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152366v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152366v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152366v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@xe_exec_balancer@once-cm-parallel-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-152366v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#4963])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@fbdev@eof.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][7] ([Intel XE#911]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#4947]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2907])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +132 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#3124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1727] / [Intel XE#3113])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#4417]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2316])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#4543]) +4 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#2049] / [Intel XE#2597])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][49] ([Intel XE#4683]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1397] / [Intel XE#1745])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1397])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#656]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#5390]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#651]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#651]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4298])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_panel_fitting@atomic-fastset.html
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2486])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#4596])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2763]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2763]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#4962])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_pm_rpm@universal-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1489]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2893])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1489]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#4950]) +62 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_sequence@get-idle.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1435])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#4459]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@discovery-race:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4837])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@xe_eudebug@discovery-race.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4837]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2322]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1392])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#1392]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#3876])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#4945]) +298 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4943]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@xe_exec_system_allocator@once-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4943]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#5018])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4915]) +51 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@xe_exec_system_allocator@twice-mmap-new-huge.html

  * igt@xe_intel_bb@blit-simple:
    - shard-adlp:         [PASS][97] -> [ABORT][98] ([Intel XE#3970])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@xe_intel_bb@blit-simple.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-2/igt@xe_intel_bb@blit-simple.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][99] -> [FAIL][100] ([Intel XE#5679])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_module_load@reload.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#3573]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4733])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#4733])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][104] ([Intel XE#4672]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][106] ([Intel XE#2134]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][108] ([Intel XE#4947]) -> [PASS][109] +12 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][110] ([Intel XE#3862]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][112] ([Intel XE#2291]) -> [PASS][113] +2 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][114] ([Intel XE#4633]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][116] ([Intel XE#2316]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][118] ([Intel XE#4543]) -> [PASS][119] +2 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-8/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][120] ([Intel XE#301]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][122] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][124] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][125] +8 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#4208]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][130] ([Intel XE#4962]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][132] ([Intel XE#4950]) -> [PASS][133] +51 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [FAIL][134] ([Intel XE#5420]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1392]) -> [PASS][137] +4 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - shard-bmg:          [SKIP][138] ([Intel XE#4945]) -> [PASS][139] +310 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][140] ([Intel XE#5018]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][142] ([Intel XE#5166]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][144] ([Intel XE#5177]) -> [FAIL][145] ([Intel XE#4665])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][146] ([Intel XE#4947]) -> [SKIP][147] ([Intel XE#2327])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][148] ([Intel XE#2327]) -> [SKIP][149] ([Intel XE#4947]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][150] ([Intel XE#1124]) -> [SKIP][151] ([Intel XE#4947]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][152] ([Intel XE#4947]) -> [SKIP][153] ([Intel XE#1124]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][154] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][155] ([Intel XE#4950])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][156] ([Intel XE#4950]) -> [SKIP][157] ([Intel XE#2314] / [Intel XE#2894])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][158] ([Intel XE#367]) -> [SKIP][159] ([Intel XE#4950]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][160] ([Intel XE#4950]) -> [SKIP][161] ([Intel XE#367])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][162] ([Intel XE#4947]) -> [SKIP][163] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][164] ([Intel XE#2887]) -> [SKIP][165] ([Intel XE#4947]) +9 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][166] ([Intel XE#3432]) -> [SKIP][167] ([Intel XE#4947]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][168] ([Intel XE#4947]) -> [SKIP][169] ([Intel XE#3432]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][170] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][171] ([Intel XE#4947])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][173] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][174] ([Intel XE#4947]) -> [SKIP][175] ([Intel XE#2887]) +10 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][176] ([Intel XE#4950]) -> [SKIP][177] ([Intel XE#2325]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][178] ([Intel XE#4950]) -> [SKIP][179] ([Intel XE#2252]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][180] ([Intel XE#2252]) -> [SKIP][181] ([Intel XE#4950]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][182] ([Intel XE#4950]) -> [SKIP][183] ([Intel XE#2390])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][184] ([Intel XE#4950]) -> [FAIL][185] ([Intel XE#1178])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][186] ([Intel XE#4950]) -> [SKIP][187] ([Intel XE#2341])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][188] ([Intel XE#2341]) -> [SKIP][189] ([Intel XE#4950])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_content_protection@mei-interface.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][190] ([Intel XE#2320]) -> [SKIP][191] ([Intel XE#4950]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][192] ([Intel XE#2321]) -> [SKIP][193] ([Intel XE#4950])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][194] ([Intel XE#4950]) -> [SKIP][195] ([Intel XE#2320])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][196] ([Intel XE#4950]) -> [SKIP][197] ([Intel XE#2321])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][198] ([Intel XE#4950]) -> [SKIP][199] ([Intel XE#2291]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][200] ([Intel XE#4947]) -> [SKIP][201] ([Intel XE#1508])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][202] ([Intel XE#4947]) -> [SKIP][203] ([Intel XE#4354])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][204] ([Intel XE#4354]) -> [SKIP][205] ([Intel XE#4947])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][206] ([Intel XE#4947]) -> [SKIP][207] ([Intel XE#2244])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][208] ([Intel XE#776]) -> [SKIP][209] ([Intel XE#4947])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][210] ([Intel XE#2375]) -> [SKIP][211] ([Intel XE#4950])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][212] ([Intel XE#4950]) -> [SKIP][213] ([Intel XE#2374])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][214] ([Intel XE#4950]) -> [SKIP][215] ([Intel XE#2316]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][216] ([Intel XE#4947]) -> [SKIP][217] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][218] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][219] ([Intel XE#4947]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][220] ([Intel XE#2311]) -> [SKIP][221] ([Intel XE#4947]) +21 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][222] ([Intel XE#2311]) -> [SKIP][223] ([Intel XE#2312]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][224] ([Intel XE#5390]) -> [SKIP][225] ([Intel XE#4947]) +11 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][226] ([Intel XE#5390]) -> [SKIP][227] ([Intel XE#2312])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][228] ([Intel XE#4947]) -> [SKIP][229] ([Intel XE#5390]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][230] ([Intel XE#4947]) -> [SKIP][231] ([Intel XE#2311]) +19 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][232] ([Intel XE#2312]) -> [SKIP][233] ([Intel XE#2311]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][234] ([Intel XE#2313]) -> [SKIP][235] ([Intel XE#4947]) +20 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][236] ([Intel XE#2313]) -> [SKIP][237] ([Intel XE#2312]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][238] ([Intel XE#4947]) -> [SKIP][239] ([Intel XE#2312]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][240] ([Intel XE#2312]) -> [SKIP][241] ([Intel XE#2313]) +5 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][242] ([Intel XE#4947]) -> [SKIP][243] ([Intel XE#2313]) +19 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][244] ([Intel XE#4950]) -> [SKIP][245] ([Intel XE#1503])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][246] ([Intel XE#4298]) -> [SKIP][247] ([Intel XE#4947])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][248] ([Intel XE#4947]) -> [SKIP][249] ([Intel XE#4090])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][250] ([Intel XE#4947]) -> [SKIP][251] ([Intel XE#4329])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][252] ([Intel XE#5021]) -> [SKIP][253] ([Intel XE#4950]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][254] ([Intel XE#4950]) -> [SKIP][255] ([Intel XE#5020])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][256] ([Intel XE#4950]) -> [SKIP][257] ([Intel XE#2763])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][258] ([Intel XE#2763]) -> [SKIP][259] ([Intel XE#4950])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][260] ([Intel XE#870]) -> [SKIP][261] ([Intel XE#4947])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][262] ([Intel XE#4947]) -> [SKIP][263] ([Intel XE#870]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][264] ([Intel XE#4947]) -> [SKIP][265] ([Intel XE#2391])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][266] ([Intel XE#2505]) -> [SKIP][267] ([Intel XE#4947])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][268] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][269] ([Intel XE#4962])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][270] ([Intel XE#4947]) -> [SKIP][271] ([Intel XE#1489]) +5 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][272] ([Intel XE#1489]) -> [SKIP][273] ([Intel XE#4947]) +7 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][274] ([Intel XE#4947]) -> [SKIP][275] ([Intel XE#2387])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          [SKIP][276] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][277] ([Intel XE#4947]) +9 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][278] ([Intel XE#4947]) -> [SKIP][279] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          [SKIP][280] ([Intel XE#4950]) -> [SKIP][281] ([Intel XE#3414] / [Intel XE#3904])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][282] ([Intel XE#4950]) -> [SKIP][283] ([Intel XE#2330])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][284] ([Intel XE#2330]) -> [SKIP][285] ([Intel XE#4950])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][286] ([Intel XE#4950]) -> [SKIP][287] ([Intel XE#2413])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][288] ([Intel XE#1435]) -> [SKIP][289] ([Intel XE#4950])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][290] ([Intel XE#2426]) -> [FAIL][291] ([Intel XE#1729])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1500]) -> [SKIP][293] ([Intel XE#362])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][294] ([Intel XE#1499]) -> [SKIP][295] ([Intel XE#4950]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][296] ([Intel XE#4945]) -> [SKIP][297] ([Intel XE#4837]) +9 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          [SKIP][298] ([Intel XE#4837]) -> [SKIP][299] ([Intel XE#4945]) +8 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_eudebug@read-metadata.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][300] ([Intel XE#4945]) -> [SKIP][301] ([Intel XE#4518])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][302] ([Intel XE#4945]) -> [SKIP][303] ([Intel XE#2322]) +6 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][304] ([Intel XE#2322]) -> [SKIP][305] ([Intel XE#4945]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][306] ([Intel XE#4943]) -> [SKIP][307] ([Intel XE#4945]) +19 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][308] ([Intel XE#4945]) -> [SKIP][309] ([Intel XE#4943]) +13 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][310] ([Intel XE#4945]) -> [SKIP][311] ([Intel XE#5694])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][312] ([Intel XE#4945]) -> [SKIP][313] ([Intel XE#5695])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][314] ([Intel XE#4945]) -> [SKIP][315] ([Intel XE#2284])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][316] ([Intel XE#2284]) -> [SKIP][317] ([Intel XE#4945]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][318] ([Intel XE#579]) -> [SKIP][319] ([Intel XE#4945])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [SKIP][320] ([Intel XE#4650]) -> [SKIP][321] ([Intel XE#4945])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][322] ([Intel XE#4945]) -> [SKIP][323] ([Intel XE#4733])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][324] ([Intel XE#4733]) -> [SKIP][325] ([Intel XE#4945]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][326] ([Intel XE#4945]) -> [SKIP][327] ([Intel XE#944]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][328] ([Intel XE#944]) -> [SKIP][329] ([Intel XE#4945])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][330] ([Intel XE#4945]) -> [SKIP][331] ([Intel XE#4130]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][332] ([Intel XE#3342]) -> [SKIP][333] ([Intel XE#4945])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][334] ([Intel XE#4273]) -> [SKIP][335] ([Intel XE#4945])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][336] ([Intel XE#4945]) -> [SKIP][337] ([Intel XE#4351])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -> xe-pw-152366v1

  IGT_8482: 8482
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a
  xe-pw-152366v1: 152366v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/index.html

--===============2514476693994706086==
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
<tr><td><b>Series:</b></td><td>drm/xe/pm: Disable RPM for SR-IOV VFs with n=
o PCIe PM capability</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152366/">https://patchwork.freedesktop.org/series/152366/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152366v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152366v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b=
861993a_FULL -&gt; xe-pw-152366v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152366v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152366v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1523=
66v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@once-cm-parallel-userptr:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@xe_exec=
_balancer@once-cm-parallel-userptr.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-2/igt@xe_exec_b=
alancer@once-cm-parallel-userptr.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152366v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@core_hot=
unplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@core_hotunplug@hot=
rebind-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@fbdev@eo=
f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152366v1/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_b=
ig_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +15=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/sha=
rd-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 ot=
her tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-434/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2=
-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard=
-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-9/igt@kms_c=
ursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_flip@2x-fl=
ip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_fli=
p@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-8/igt@kms_flip@basic-=
plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible@b-dp4.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_=
flip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Inte=
l XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests =
skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_panel_fitting@atomic-fa=
stset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_pm_r=
pm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_rpm@universal-plan=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_sequ=
ence@get-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_sequence@get-idle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950"=
>Intel XE#4950</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152366v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@xe_eudebug@discovery-race.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpo=
int.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_eudebug_online@set-break=
point.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-null.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-432/igt@xe_exec_basic@mu=
ltigpu-once-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_=
reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-3/igt@xe_exec_reset@paralle=
l-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_=
system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shar=
d-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemse=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4945">Intel XE#4945</a>) +298 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-lnl-1/igt@xe_exec_system_allocator@once=
-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_exec_system_allocator@thre=
ads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152366v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-436/igt@xe_exec_system_allocator@tw=
ice-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-simple:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@xe_inte=
l_bb@blit-simple.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152366v1/shard-adlp-2/igt@xe_intel_bb@blit-simple.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_modul=
e_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_module_load@reload.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679"=
>Intel XE#5679</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_oa@oa-regs-whitelisted.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-re=
ndercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152366v1/shard-dg2-463/igt@xe_pxp@pxp-src-to-pxp-dest-=
rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_set=
master@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@cor=
e_setmaster@master-drop-set-root.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@wr=
ite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@fbdev@write.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
366v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/=
shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-4/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-4/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_fli=
p@basic-plain-flip@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-adlp-8=
/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-=
2/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/sh=
ard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-434/=
igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_vbla=
nk@wait-busy-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_vblank@wa=
it-busy-hang.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_st=
all@blocking-re-enable.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_eu_st=
all@blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152366v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-us=
erptr-invalidate-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-execqueues-mmap.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/s=
hard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html">=
PASS</a> +310 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152366v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-dg2-435/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@intel_hwmon@hwm=
on-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_=
fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_bi=
g_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_=
fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_=
big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shar=
d-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/=
shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152366v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/sh=
ard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@l=
inear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/=
igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-=
5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
47">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152366v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg=
-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_chamel=
ium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/ig=
t@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cham=
elium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_cha=
melium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@km=
s_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_curs=
or_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_=
cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_curs=
or_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-=
5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/=
igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@k=
ms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_fbcon_fbt@p=
sr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-=
bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152366v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-=
yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#53=
90</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2366v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152366v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152366v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard=
-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg=
-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_pm_backlight@=
fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel X=
E#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152366v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">=
Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52366v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v=
1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-=
5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@kms_psr@p=
sr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rota=
tion_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@kms_rotatio=
n_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bm=
g-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-b=
mg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudeb=
ug@basic-vm-bind-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@xe_eude=
bug@basic-vm-bind-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +9 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_eudeb=
ug@read-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_eudebug@rea=
d-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@xe_eudebu=
g_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152366v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-=
5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1523=
66v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4945">Intel XE#4945</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#=
4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152366v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-m=
map-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/igt@xe_pm@d3hot-i2c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569=
5">Intel XE#5695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_pm@s3-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_pm@vram-d3=
cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_pmu@a=
ll-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_p=
mu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8/igt@x=
e_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_pxp@p=
xp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg=
-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query=
@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-1/i=
gt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-8=
/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_sriov=
_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_srio=
v_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_sriov=
_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-5/igt@xe_sriov_flr@flr=
-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov=
_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152366v1/shard-bmg-6/igt@xe=
_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -&gt; xe-pw-152=
366v1</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e=
45629e576b861993a<br />
  xe-pw-152366v1: 152366v1</p>

</body>
</html>

--===============2514476693994706086==--
