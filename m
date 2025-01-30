Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBCDC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 04:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4949F10E13B;
	Thu, 30 Jan 2025 04:32:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBF410E13B;
 Thu, 30 Jan 2025 04:32:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8520004146207237930=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PF=3A_Mitigate_unexpected_?=
 =?utf-8?q?GuC_VF_config_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 04:32:39 -0000
Message-ID: <173821155926.2729658.4957710089600267876@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129195947.764-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250129195947.764-1-michal.wajdeczko@intel.com>
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

--===============8520004146207237930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Mitigate unexpected GuC VF config checks
URL   : https://patchwork.freedesktop.org/series/144120/
State : failure

== Summary ==

CI Bug Log - changes from xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139_full -> xe-pw-144120v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144120v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144120v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144120v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_sequence@queue-busy@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_sequence@queue-busy@pipe-c-dp-4.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_pm@d3hot-mmap-vram.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_pm@d3hot-mmap-vram.html

  
#### Warnings ####

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_sequence@queue-busy:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_sequence@queue-busy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_sequence@queue-busy.html

  
Known issues
------------

  Here are the changes found in xe-pw-144120v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][11] -> [FAIL][12] ([Intel XE#3440]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@core_getversion@all-cards.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2136]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [ABORT][15] ([Intel XE#3914])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2134])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@fbdev@eof.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@fbdev@eof.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2134]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@fbdev@info.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@fbdev@info.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1033])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2423] / [i915#2575]) +80 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#619])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#2907]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2907])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#3442])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][36] -> [ABORT][37] ([Intel XE#2625])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][38] ([Intel XE#2625])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +160 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2887]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][41] ([Intel XE#3124] / [Intel XE#4010])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1727])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#314]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#373]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#373])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#1178])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2423] / [i915#2575]) +29 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_content_protection@lic-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#3278]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178]) +2 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#323]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#877])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2291])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#4172])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-2/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1340])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#455]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1135])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#310]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2316]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#3321]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][73] ([Intel XE#4172]) +6 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#2136]) +18 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401] / [Intel XE#1745])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][80] ([Intel XE#1033])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#656]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][84] ([Intel XE#2050])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#651]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#653]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2313]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#653]) +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#656]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2136]) +34 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#2927])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#4173])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2953])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][97] ([Intel XE#1033]) +8 other tests dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#616])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2763]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2763] / [Intel XE#455])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2763]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#2446])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_pm_rpm@cursor-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2446]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2446]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1489]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1489]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1122])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#2423]) +44 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_sequence@get-idle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_sequence@get-idle.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1499])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_vrr@lobf.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#455] / [Intel XE#488])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2905])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#3889])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2905]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2905])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2905]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1130]) +53 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#1130]) +141 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1392]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#1392]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1392])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#288]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#288]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@spin:
    - shard-dg2-set2:     [PASS][131] -> [DMESG-WARN][132] ([Intel XE#1033]) +1 other test dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_exec_reset@spin.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_exec_reset@spin.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][133] -> [SKIP][134] ([Intel XE#1192])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1192])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1999]) +2 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#4045])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162]) -> ([PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [SKIP][188]) ([Intel XE#378])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-9/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-9/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-3/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][189] -> [FAIL][190] ([Intel XE#3546])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_module_load@many-reload.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#2541] / [Intel XE#3573])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_oa@rc6-disable.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [PASS][193] -> [ABORT][194] ([Intel XE#1358] / [Intel XE#1794])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_pm@s3-basic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][195] -> [ABORT][196] ([Intel XE#1358] / [Intel XE#1607])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_pm@s4-basic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][197] -> [ABORT][198] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][199] -> [ABORT][200] ([Intel XE#1358] / [Intel XE#1794])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#944])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#944])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][203] -> [SKIP][204] ([Intel XE#1130]) +89 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@xe_query@query-gt-list.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_query@query-gt-list.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#4130])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2423]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@core_getstats.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@core_getstats.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][208] ([Intel XE#3249]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2134]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@fbdev@info.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@fbdev@info.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][212] ([Intel XE#1033]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][214] ([Intel XE#3908]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][216] ([Intel XE#2136]) -> [PASS][217] +8 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-adlp:         [DMESG-WARN][218] -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][221] +8 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2423] / [i915#2575]) -> [PASS][223] +90 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][224] ([Intel XE#4172]) -> [PASS][225] +18 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][226] ([Intel XE#2291]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [INCOMPLETE][228] ([Intel XE#3226] / [Intel XE#4172]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_cursor_legacy@forked-bo.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][230] ([Intel XE#2373]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [SKIP][232] ([Intel XE#2316]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_flip@2x-busy-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][234] ([Intel XE#301]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][236] ([Intel XE#3321]) -> [PASS][237] +5 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][238] ([Intel XE#2423]) -> [PASS][239] +35 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][240] ([Intel XE#2955]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][242] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2136]) -> [PASS][245] +35 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][246] ([Intel XE#3012]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2446]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][250] ([Intel XE#2446]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][252] ([Intel XE#899]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1392]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-adlp:         [DMESG-WARN][256] ([Intel XE#4173]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [FAIL][258] ([Intel XE#1999]) -> [PASS][259] +2 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [SKIP][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285]) ([Intel XE#378]) -> ([PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-5/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-7/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-7/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-7/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-6/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-6/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-3/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-3/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-8/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-5/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-5/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-1/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-8/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-6/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-1/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-1/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-8/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-3/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-1/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-4/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-4/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-5/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-5/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-1/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-6/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-6/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-6/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-3/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-3/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-3/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-4/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-5/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-1/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([SKIP][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336]) ([Intel XE#378]) -> ([PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][362] ([Intel XE#1358]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][364] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@xe_pm@s4-basic.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][366] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          [SKIP][368] ([Intel XE#1130]) -> [PASS][369] +79 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_vm@bind-once.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_vm@bind-once.html

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - shard-dg2-set2:     [DMESG-WARN][370] ([Intel XE#1033]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-33554432.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-33554432.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1130]) -> [PASS][373] +167 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2136]) -> [DMESG-WARN][375] ([Intel XE#1033])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@core_hotunplug@unplug-rescan.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#623]) -> [SKIP][377] ([Intel XE#2423] / [i915#2575])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][378] ([Intel XE#2385]) -> [SKIP][379] ([Intel XE#2423])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2423] / [i915#2575]) -> [SKIP][381] ([Intel XE#455]) +6 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][382] ([Intel XE#2136]) -> [SKIP][383] ([Intel XE#2327]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#316]) -> [SKIP][385] ([Intel XE#2136] / [Intel XE#2351])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#2136]) -> [SKIP][387] ([Intel XE#316])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][388] ([Intel XE#2327]) -> [SKIP][389] ([Intel XE#2136]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#316]) -> [SKIP][391] ([Intel XE#2136]) +3 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#1124]) -> [SKIP][393] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#610]) -> [SKIP][395] ([Intel XE#2136])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][396] ([Intel XE#2136]) -> [SKIP][397] ([Intel XE#1124]) +5 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          [SKIP][398] ([Intel XE#1124]) -> [SKIP][399] ([Intel XE#2136]) +5 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][401] ([Intel XE#1124]) +2 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2136]) -> [SKIP][403] ([Intel XE#1124]) +8 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2136]) -> [SKIP][405] ([Intel XE#607])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1124]) -> [SKIP][407] ([Intel XE#2136]) +5 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2191]) -> [SKIP][409] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][410] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][411] ([Intel XE#2423]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#2423] / [i915#2575]) -> [SKIP][413] ([Intel XE#2191]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2423] / [i915#2575]) -> [SKIP][415] ([Intel XE#367])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][416] ([Intel XE#2423]) -> [SKIP][417] ([Intel XE#367]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#367]) -> [SKIP][419] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          [SKIP][420] ([Intel XE#367]) -> [SKIP][421] ([Intel XE#2423])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][423] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#2136]) -> [SKIP][425] ([Intel XE#2907])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][426] ([Intel XE#2887]) -> [SKIP][427] ([Intel XE#2136]) +7 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#2136]) -> [SKIP][429] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][430] ([Intel XE#1033]) -> [SKIP][431] ([Intel XE#2136] / [Intel XE#2351])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][433] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][434] -> [SKIP][435] ([Intel XE#2136])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][436] ([Intel XE#3432]) -> [SKIP][437] ([Intel XE#2136])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][438] ([Intel XE#2136]) -> [SKIP][439] ([Intel XE#2887]) +8 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2136]) -> [INCOMPLETE][441] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][442] ([Intel XE#2692] / [Intel XE#4010]) -> [SKIP][443] ([Intel XE#2136])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][445] ([Intel XE#2136]) +12 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][446] ([Intel XE#2423]) -> [SKIP][447] ([Intel XE#2325])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#306]) -> [SKIP][449] ([Intel XE#2423] / [i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][450] ([Intel XE#2325]) -> [SKIP][451] ([Intel XE#2423])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_chamelium_color@degamma.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2423] / [i915#2575]) -> [SKIP][453] ([Intel XE#306]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][454] ([Intel XE#2252]) -> [SKIP][455] ([Intel XE#2423]) +5 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][456] ([Intel XE#2423]) -> [SKIP][457] ([Intel XE#2252]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#373]) -> [SKIP][459] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2423] / [i915#2575]) -> [SKIP][461] ([Intel XE#373]) +12 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][462] ([Intel XE#2423]) -> [FAIL][463] ([Intel XE#1178])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_content_protection@atomic.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#2423] / [i915#2575]) -> [FAIL][465] ([Intel XE#1178]) +1 other test fail
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][466] ([Intel XE#2423]) -> [SKIP][467] ([Intel XE#2390])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][468] ([Intel XE#1178]) -> [SKIP][469] ([Intel XE#2423] / [i915#2575])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][470] ([Intel XE#1178]) -> [SKIP][471] ([Intel XE#2341])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][472] ([Intel XE#2423]) -> [SKIP][473] ([Intel XE#2341])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_content_protection@lic-type-1.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2423] / [i915#2575]) -> [SKIP][475] ([Intel XE#308]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-bmg:          [SKIP][476] ([Intel XE#2321]) -> [SKIP][477] ([Intel XE#2423])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][478] ([Intel XE#2423]) -> [SKIP][479] ([Intel XE#2321])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][480] ([Intel XE#2320]) -> [SKIP][481] ([Intel XE#2423])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][482] ([Intel XE#2423]) -> [SKIP][483] ([Intel XE#2320]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#323]) -> [SKIP][485] ([Intel XE#2423] / [i915#2575])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-bmg:          [SKIP][486] ([Intel XE#2423]) -> [SKIP][487] ([Intel XE#2286])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][488] ([Intel XE#1508]) -> [SKIP][489] ([Intel XE#2136])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2423] / [i915#2575]) -> [SKIP][491] ([Intel XE#307])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][492] ([Intel XE#2244]) -> [SKIP][493] ([Intel XE#2136])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_dsc@dsc-basic.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][495] ([Intel XE#455]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#2136]) -> [SKIP][497] ([Intel XE#776])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][498] ([Intel XE#2423]) -> [SKIP][499] ([Intel XE#2374])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [FAIL][500] ([Intel XE#3098] / [Intel XE#3149] / [Intel XE#886]) -> [FAIL][501] ([Intel XE#886])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][502] ([Intel XE#3098]) -> [FAIL][503] ([Intel XE#886])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][504] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][505] ([Intel XE#2136]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#455]) -> [SKIP][507] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][508] ([Intel XE#2136]) -> [SKIP][509] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#2136]) -> [SKIP][511] ([Intel XE#455]) +3 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#455]) -> [SKIP][513] ([Intel XE#2136]) +3 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][514] ([Intel XE#2136]) -> [SKIP][515] ([Intel XE#2311]) +14 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#651]) -> [SKIP][517] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][518] ([Intel XE#2311]) -> [SKIP][519] ([Intel XE#2312]) +7 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2136]) -> [SKIP][521] ([Intel XE#651]) +17 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#651]) -> [SKIP][523] ([Intel XE#2136]) +17 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][524] ([Intel XE#2311]) -> [SKIP][525] ([Intel XE#2136]) +14 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][526] ([Intel XE#4141]) -> [SKIP][527] ([Intel XE#2136]) +5 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][528] ([Intel XE#2312]) -> [SKIP][529] ([Intel XE#4141]) +3 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][530] ([Intel XE#4141]) -> [SKIP][531] ([Intel XE#2312]) +5 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [DMESG-WARN][532] ([Intel XE#1033]) -> [SKIP][533] ([Intel XE#2136])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][535] ([Intel XE#1033]) +1 other test dmesg-warn
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][536] ([Intel XE#2136]) -> [SKIP][537] ([Intel XE#4141]) +5 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][539] ([Intel XE#651]) +10 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][540] ([Intel XE#2312]) -> [SKIP][541] ([Intel XE#2311]) +8 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][543] ([Intel XE#658])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#653]) -> [SKIP][545] ([Intel XE#2136]) +18 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][546] ([Intel XE#2312]) -> [SKIP][547] ([Intel XE#2313]) +5 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][548] ([Intel XE#2313]) -> [SKIP][549] ([Intel XE#2136]) +13 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][550] ([Intel XE#2136]) -> [SKIP][551] ([Intel XE#2350])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#2136]) -> [SKIP][553] ([Intel XE#653]) +26 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][555] ([Intel XE#653]) +5 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][556] ([Intel XE#2136]) -> [SKIP][557] ([Intel XE#2313]) +13 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][558] ([Intel XE#2313]) -> [SKIP][559] ([Intel XE#2312]) +7 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#653]) -> [SKIP][561] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2-set2:     [DMESG-WARN][562] ([Intel XE#1033]) -> [SKIP][563] ([Intel XE#2423] / [i915#2575])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][564] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][565] ([Intel XE#3544])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#2136]) -> [SKIP][567] ([Intel XE#346])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][568] ([Intel XE#2927]) -> [SKIP][569] ([Intel XE#2136])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#2927]) -> [SKIP][571] ([Intel XE#2136])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#2925]) -> [SKIP][573] ([Intel XE#2136])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#2423] / [i915#2575]) -> [SKIP][575] ([Intel XE#356])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][576] ([Intel XE#2423]) -> [SKIP][577] ([Intel XE#2486])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [ABORT][578] ([Intel XE#1033] / [Intel XE#2625] / [Intel XE#4080]) -> [DMESG-WARN][579] ([Intel XE#1033])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][581] ([Intel XE#1033])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][582] ([Intel XE#616]) -> [SKIP][583] ([Intel XE#2423] / [i915#2575])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_plane_cursor@primary.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#2423] / [i915#2575]) -> [FAIL][585] ([Intel XE#616])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_plane_cursor@viewport.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][586] ([Intel XE#2423]) -> [DMESG-WARN][587] ([Intel XE#4172]) +6 other tests dmesg-warn
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][588] ([Intel XE#2763]) -> [SKIP][589] ([Intel XE#2423])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#2423] / [i915#2575]) -> [SKIP][591] ([Intel XE#2763] / [Intel XE#455])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#2938]) -> [SKIP][593] ([Intel XE#2136])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#2136]) -> [SKIP][595] ([Intel XE#870])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][597] ([Intel XE#1122])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-bmg:          [SKIP][598] ([Intel XE#2136]) -> [DMESG-WARN][599] ([Intel XE#4172])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_dc@dc5-dpms.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][600] ([Intel XE#3309]) -> [SKIP][601] ([Intel XE#2136])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][602] ([Intel XE#2446]) -> [SKIP][603] ([Intel XE#1439] / [Intel XE#836])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][604] ([Intel XE#2446]) -> [SKIP][605] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#2136]) -> [SKIP][607] ([Intel XE#1489]) +8 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][608] ([Intel XE#1489]) -> [SKIP][609] ([Intel XE#2136]) +3 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][610] ([Intel XE#2136]) -> [SKIP][611] ([Intel XE#1489]) +2 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#1489]) -> [SKIP][613] ([Intel XE#2136]) +9 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#2136]) -> [SKIP][615] ([Intel XE#1122]) +1 other test skip
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][616] ([Intel XE#2136]) -> [SKIP][617] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][619] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][621] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][623] ([Intel XE#2136]) +11 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#2136]) -> [SKIP][625] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_psr@pr-basic.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][626] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][627] ([Intel XE#2136]) +6 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#3414]) -> [SKIP][629] ([Intel XE#2423] / [i915#2575])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][630] ([Intel XE#2330]) -> [SKIP][631] ([Intel XE#2423])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#1127]) -> [SKIP][633] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#2423] / [i915#2575]) -> [SKIP][635] ([Intel XE#3414]) +2 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][636] ([Intel XE#2426]) -> [SKIP][637] ([Intel XE#2423])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#2423] / [i915#2575]) -> [FAIL][639] ([Intel XE#1729])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#2423] / [i915#2575]) -> [SKIP][641] ([Intel XE#2168])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_vrr@cmrr.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#455]) -> [SKIP][643] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][644] ([Intel XE#1499]) -> [SKIP][645] ([Intel XE#2423]) +1 other test skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][646] ([Intel XE#2423]) -> [SKIP][647] ([Intel XE#2168])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_vrr@lobf.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][648] ([Intel XE#2423]) -> [SKIP][649] ([Intel XE#756])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][650] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][651] ([Intel XE#2423])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg2-set2:     [SKIP][652] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][653] ([Intel XE#2423] / [i915#2575])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][654] -> [DMESG-WARN][655] ([Intel XE#2705])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@testdisplay.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#1130]) -> [SKIP][657] ([Intel XE#1123])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#1123]) -> [SKIP][659] ([Intel XE#1130])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][660] ([Intel XE#1126]) -> [SKIP][661] ([Intel XE#1130])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#1130]) -> [SKIP][663] ([Intel XE#1126])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#1130]) -> [SKIP][665] ([Intel XE#2905]) +9 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_eudebug@basic-close.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#2905]) -> [SKIP][667] ([Intel XE#1130]) +11 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][668] ([Intel XE#1130]) -> [SKIP][669] ([Intel XE#2905]) +4 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][670] ([Intel XE#1130]) -> [SKIP][671] ([Intel XE#3889])
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#1130]) -> [SKIP][673] ([Intel XE#3889])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][674] ([Intel XE#2905]) -> [SKIP][675] ([Intel XE#1130]) +3 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][676] ([Intel XE#1392]) -> [SKIP][677] ([Intel XE#1130]) +2 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][678] ([Intel XE#2322]) -> [SKIP][679] ([Intel XE#1130]) +3 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#1130]) -> [SKIP][681] ([Intel XE#1392]) +1 other test skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          [SKIP][682] ([Intel XE#1130]) -> [SKIP][683] ([Intel XE#2322]) +3 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][684] ([Intel XE#1130]) -> [DMESG-WARN][685] ([Intel XE#4172]) +1 other test dmesg-warn
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][686] ([Intel XE#1130]) -> [SKIP][687] ([Intel XE#288]) +25 other tests skip
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#288]) -> [SKIP][689] ([Intel XE#1130]) +23 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][690] ([Intel XE#1130]) -> [SKIP][691] ([Intel XE#2360])
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][692] ([Intel XE#1130]) -> [SKIP][693] ([Intel XE#586])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_mmap@small-bar.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][694] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][695] ([Intel XE#1130]) +8 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][696] ([Intel XE#1130]) -> [SKIP][697] ([Intel XE#2541] / [Intel XE#3573]) +7 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_oa@polling-small-buf.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][698] ([Intel XE#1337]) -> [SKIP][699] ([Intel XE#1130])
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][700] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][701] ([Intel XE#1130])
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][702] ([Intel XE#1130]) -> [SKIP][703] ([Intel XE#2245])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][704] ([Intel XE#1173]) -> [SKIP][705] ([Intel XE#1061])
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_peer2peer@read.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][706] ([Intel XE#1130]) -> [SKIP][707] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][708] ([Intel XE#2284]) -> [SKIP][709] ([Intel XE#1130])
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][710] ([Intel XE#2284]) -> [SKIP][711] ([Intel XE#1130])
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][712] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][713] ([Intel XE#1130])
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [SKIP][714] ([Intel XE#1130]) -> [DMESG-WARN][715] ([Intel XE#4172] / [Intel XE#569]) +1 other test dmesg-warn
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_pm@s3-mocs.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][716] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][717] ([Intel XE#1130])
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][718] ([Intel XE#944]) -> [SKIP][719] ([Intel XE#1130])
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][720] ([Intel XE#1130]) -> [SKIP][721] ([Intel XE#944]) +1 other test skip
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][722] ([Intel XE#1130]) -> [SKIP][723] ([Intel XE#944]) +2 other tests skip
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][724] ([Intel XE#944]) -> [SKIP][725] ([Intel XE#1130])
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          [SKIP][726] ([Intel XE#1130]) -> [SKIP][727] ([Intel XE#4130])
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
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
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4080
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139 -> xe-pw-144120v1

  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139: 45746920fb499b7ad35883c94ebfbedda6c40139
  xe-pw-144120v1: 144120v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/index.html

--===============8520004146207237930==
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
<tr><td><b>Series:</b></td><td>PF: Mitigate unexpected GuC VF config checks=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144120/">https://patchwork.freedesktop.org/series/144120/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144120v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144120v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2571-45746920fb499b7ad35883c94ebfbedda=
6c40139_full -&gt; xe-pw-144120v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144120v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144120v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1441=
20v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@core_h=
otunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@core_hotunplug=
@hotrebind-lateclose.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_sequence@queue-busy@pip=
e-c-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_pm@=
d3hot-mmap-vram.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_pm@d3hot-mmap-vram.html"=
>FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_se=
quence@queue-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/=
igt@kms_sequence@queue-busy.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144120v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@core_getversion@all-car=
ds.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3440">Intel XE#3440</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@core_hotunplug@hotreplug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@core_hotunplug@hotunplug-res=
can.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@fbdev@=
eof.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144120v1/shard-dg2-433/igt@fbdev@eof.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144120v1/shard-bmg-3/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@=
kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displ=
ays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_chamelium_edid@vga-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_content_protection@lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +29 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-2/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_curs=
or_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-2/igt@kms=
_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#417=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_dsc@dsc-fractional-bpp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_flip@2x-modeset-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip@flip-v=
s-expired-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip@single-buffer-flip-v=
s-dpms-off-vs-modeset@d-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +6 other=
 tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard=
-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1=
745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Inte=
l XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-=
433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-shrfb-plflip-blt.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@kms_pip=
e_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@kms_pipe_crc_ba=
sic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/i=
gt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Inte=
l XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-=
read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +8 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_plane_cursor@viewport@p=
ipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_pm_r=
pm@cursor-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_pm_rpm@cursor-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/244=
6">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_pm=
_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_pm_rpm@modeset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_pm_rpm@universal-planes=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_psr2_sf@psr2-cursor-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr@fbc-pr-primary-page=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@kms_psr@fbc-psr-primary-page=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_sequ=
ence@get-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_sequence@get-idle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_eudebug@basic-vm-access-p=
arameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ex=
tended-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_eudebug_online@writes-cac=
hing-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_balancer@many-virtu=
al-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +53 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_bal=
ancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +141 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-n=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_exec_fault_mode@once-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@spin:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_exe=
c_reset@spin.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_exec_reset@spin.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
2">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_mmap@pci-membarrier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c4013=
9/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6=
c40139/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfb=
edda6c40139/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c9=
4ebfbedda6c40139/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35=
883c94ebfbedda6c40139/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b=
7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920f=
b499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-4574=
6920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571=
-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c4013=
9/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6=
c40139/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfb=
edda6c40139/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c9=
4ebfbedda6c40139/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35=
883c94ebfbedda6c40139/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-a=
dlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144120v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144120v1/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144120v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144120v1/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120=
v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44120v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_module_load@load.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Int=
el XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_oa@non-system-wide-parano=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_oa@rc6-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_pm@=
s3-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_pm@s3-basic.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE=
#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_pm@s=
4-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1=
358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
07">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-2/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind=
-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_pm@s4=
-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/igt@xe_query@multigpu-query-oa-u=
nits.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_query@multigpu-query-top=
ology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@xe_query=
@query-gt-list.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_query@query-gt-list.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@core_g=
etstats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@core_getstats.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt=
@core_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@fbdev@=
info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@fbdev@info.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-6/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-3/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-b=
mg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +8 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@kms_big=
_fb@y-tiled-16bpp-rotate-180.html">DMESG-WARN</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-3/igt@kms_big_f=
b@y-tiled-16bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sha=
rd-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +90 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-4/igt@kms=
_cursor_crc@cursor-suspend.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-b=
mg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_curs=
or_legacy@forked-bo.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-b=
mg-7/igt@kms_cursor_legacy@forked-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-8/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_flip=
@2x-busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_flip@2x-busy-=
flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@km=
s_flip@2x-flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>=
 +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7/igt@kms_flip=
@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@kms_flip=
@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shar=
d-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4120v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb=
-draw-blt.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-7=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pm=
_rpm@legacy-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_pm_rpm=
@legacy-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_r=
pm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_rpm@=
universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-7/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl=
-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1=
/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-4/igt@xe_faul=
t_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#=
4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144120v1/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_=
prepare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-b=
mg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c4=
0139/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedd=
a6c40139/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebf=
bedda6c40139/shard-lnl-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c9=
4ebfbedda6c40139/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad358=
83c94ebfbedda6c40139/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7a=
d35883c94ebfbedda6c40139/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb49=
9b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920=
fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-4574=
6920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-=
45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c4013=
9/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144120v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144120v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144120v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144120v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6=
c40139/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebf=
bedda6c40139/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad3588=
3c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7=
ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920f=
b499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-457=
46920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
71-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c4=
0139/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbe=
dda6c40139/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c9=
4ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad3=
5883c94ebfbedda6c40139/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb49=
9b7ad35883c94ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-457469=
20fb499b7ad35883c94ebfbedda6c40139/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-=
45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-43=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4120v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144120v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44120v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144120v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144120v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_pm@=
s2idle-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_p=
m@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-8/igt@xe_pm@s4-=
basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-adlp-2/i=
gt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_vm@bi=
nd-once.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_vm@bind-once.html">P=
ASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_vm@=
large-userptr-misaligned-binds-33554432.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/s=
hard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-33554432.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_vm@=
munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PA=
SS</a> +167 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@core_h=
otunplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@core_h=
otunplug@unplug-rescan.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-=
433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_atom=
ic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg=
-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_at=
omic_transition@plane-all-modeset-transition-fencing-internal-panels.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_atomic_transition=
@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms=
_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bi=
g_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@=
kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_big_=
fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_=
big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@km=
s_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt=
@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_=
big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt=
@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel X=
E#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144120v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rota=
te-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144120v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144120v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_bw@l=
inear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/=
igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_bw=
@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-43=
3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_bw@l=
inear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/ig=
t@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120=
v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cc=
s@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434=
/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_ccs@=
ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bm=
g-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cc=
s@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/=
igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1=
/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144120v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shar=
d-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-=
434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel=
 XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144120v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cham=
elium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@k=
ms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_chame=
lium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434=
/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_cham=
elium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cham=
elium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/ig=
t@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_=
chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ch=
amelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"=
>Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_co=
ntent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shar=
d-dg2-466/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@km=
s_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1=
/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_curs=
or_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-=
5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg=
-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_di=
splay_modes@mst-extended-mode-negative.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
7">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_dsc@=
dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_dsc@dsc-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ds=
c@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/=
igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@kms_flip=
@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120=
v1/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-lnl-2/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-lnl-7/ig=
t@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">I=
ntel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144120v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144120v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64b=
pp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144120v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-=
64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144120v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120=
v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14412=
0v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sha=
rd-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v=
1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144120v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other=
 test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144120v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">I=
ntel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sha=
rd-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4120v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144120v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4120v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44120v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ge=
tfb@getfb2-accept-ccs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@k=
ms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-6/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sha=
rd-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44120v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pane=
l_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4080">Intel =
XE#4080</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144120v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
120v1/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_pl=
ane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_plane_cu=
rsor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pl=
ane_cursor@viewport.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466=
/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4120v1/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pix=
el-format.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4172">Intel XE#4172</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144120v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-=
upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/igt@=
kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg=
2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_d=
c@dc5-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_dc@dc5-dpms.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/ig=
t@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3=
141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
6">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_psr2=
_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-ful=
ly-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_psr2=
_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sha=
rd-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">=
Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/s=
hard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_psr@=
fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_psr@fbc-p=
r-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ps=
r@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-466/=
igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ps=
r@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-d=
g2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ps=
r@pr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_psr@pr-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_psr@=
psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@k=
ms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-436/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_rot=
ation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bm=
g-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4120v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@kms_writ=
eback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@kms_write=
back@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-4/igt@sriov_ba=
sic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shar=
d-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/sh=
ard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@testdi=
splay.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@testdisplay.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/i=
gt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_eud=
ebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-d=
g2-434/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE=
#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_eudeb=
ug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_eud=
ebug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_exec_basic@multigpu-ma=
ny-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel=
 XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2=
322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44120v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null=
-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard=
-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_exec_=
basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5=
/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_exec_=
compute_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bm=
g-5/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Inte=
l XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_exe=
c_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
20v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/=
shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v=
1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_oa@=
polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@xe_oa@polli=
ng-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@=
xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-434/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_pm@=
s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-=
dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_pm@s3=
-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/igt@xe_pm@s3-mocs.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
172">Intel XE#4172</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-466/igt@xe_pm@=
s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2=
-433/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-432/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-433/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/i=
gt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-433/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-4=
34/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-5/igt@xe_query=
@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-3/ig=
t@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-bmg-3/igt@xe_sriov=
_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-bmg-5/=
igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)=
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139 -&gt; xe-pw-144=
120v1</li>
</ul>
<p>IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139: 45746920fb499b7ad35883c=
94ebfbedda6c40139<br />
  xe-pw-144120v1: 144120v1</p>

</body>
</html>

--===============8520004146207237930==--
