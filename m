Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FA6C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 20:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB2510E7E0;
	Wed, 15 Jan 2025 20:44:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40F210E51F;
 Wed, 15 Jan 2025 20:44:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7428684980045829775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Fix_sort_order_o?=
 =?utf-8?q?f_=2Eo_lists_in_Makefile?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 20:44:41 -0000
Message-ID: <173697388167.4085111.14825707125608135807@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
In-Reply-To: <20250115140812.20799-1-gustavo.sousa@intel.com>
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

--===============7428684980045829775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix sort order of .o lists in Makefile
URL   : https://patchwork.freedesktop.org/series/143557/
State : failure

== Summary ==

CI Bug Log - changes from xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09_full -> xe-pw-143557v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143557v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143557v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143557v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
    - shard-lnl:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][8] -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     NOTRUN -> [ABORT][10] +2 other tests abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html

  
Known issues
------------

  Here are the changes found in xe-pw-143557v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2134])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@fbdev@eof.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@fbdev@eof.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3279])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][17] ([Intel XE#1033])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1033]) +12 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +167 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1727] / [Intel XE#3113])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#3124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2907]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#307])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#308]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1424])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#309])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#309])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#323]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][50] ([Intel XE#877])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#2882]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#2882] / [Intel XE#3820])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][54] ([Intel XE#3820]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#301])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2316]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][59] -> [INCOMPLETE][60] ([Intel XE#3937])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][61] -> [DMESG-WARN][62] ([Intel XE#2953]) +13 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#886]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2293])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#1033] / [Intel XE#324]) +1 other test dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +16 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +31 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#658])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#651])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#651]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#653]) +26 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1158])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#653]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#1503])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [PASS][82] -> [ABORT][83] ([Intel XE#2625])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_hdr@static-toggle-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][84] ([Intel XE#4048])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#346])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#346])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2925])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2934])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#346])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#3012])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#3007]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_lease@lease-uevent.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2763]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2763]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#870])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#908])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1489]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1122]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1406])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-8/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1127])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#3414])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#3414] / [Intel XE#3904])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#330])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#2159]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#1522]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-5/igt@kms_vrr@max-min.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#756])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1126])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#3889])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#3889])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#3889])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2905]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#2905])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2905])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1392]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1392])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null.html
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1392])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#288]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#288]) +23 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2360])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2229])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#1192])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][130] ([Intel XE#1999]) +2 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#4045])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@xe_mmap@pci-membarrier.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2541] / [Intel XE#3573]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][133] -> [ABORT][134] ([Intel XE#1358])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2284] / [Intel XE#366])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#944])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#944]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@query-invalid-extension:
    - shard-bmg:          [PASS][139] -> [SKIP][140] ([Intel XE#1130]) +19 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_query@query-invalid-extension.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@xe_query@query-invalid-extension.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][141] -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#3249]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][145] ([Intel XE#2134]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@fbdev@unaligned-read.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@fbdev@unaligned-read.html
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2134]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@fbdev@unaligned-read.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#1033]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][151] ([Intel XE#827]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][153] ([Intel XE#3884]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][155] -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][157] ([Intel XE#2136] / [Intel XE#2231]) -> [PASS][158] +4 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2136]) -> [PASS][160] +4 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [DMESG-FAIL][161] ([Intel XE#1033]) -> [PASS][162] +10 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#3862]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_color@degamma:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2423] / [i915#2575]) -> [PASS][166] +12 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_color@degamma.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-bmg:          [SKIP][167] ([Intel XE#3007]) -> [PASS][168] +12 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#2953]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][171] ([Intel XE#2291]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][173] -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][175] ([Intel XE#2882]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][177] ([Intel XE#2316]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][179] ([Intel XE#2882] / [Intel XE#3820]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][181] ([Intel XE#3820]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][183] ([Intel XE#301]) -> [PASS][184] +6 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#886]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2:
    - shard-dg2-set2:     [FAIL][187] -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][189] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][191] ([Intel XE#1861]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-lnl:          [INCOMPLETE][193] ([Intel XE#2050]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][195] ([Intel XE#1874]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#877]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][199] ([Intel XE#718]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1130]) -> [PASS][202] +21 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_evict@evict-beng-large-cm.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1392]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
    - shard-bmg:          [SKIP][205] ([Intel XE#1130]) -> [PASS][206] +29 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][207] ([Intel XE#1192]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][209] ([Intel XE#1358]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][211] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2423] / [i915#2575]) -> [SKIP][214] ([Intel XE#455])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-bmg:          [SKIP][215] ([Intel XE#3007]) -> [SKIP][216] ([Intel XE#2370])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2136]) -> [SKIP][218] ([Intel XE#1124])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-bmg:          [SKIP][219] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][220] ([Intel XE#1124]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][222] ([Intel XE#1124])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][223] ([Intel XE#1124]) -> [SKIP][224] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][225] ([Intel XE#3007]) -> [SKIP][226] ([Intel XE#2314] / [Intel XE#2894])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2423] / [i915#2575]) -> [SKIP][228] ([Intel XE#2191])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2136]) -> [SKIP][230] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][231] ([Intel XE#3432]) -> [SKIP][232] ([Intel XE#2136] / [Intel XE#2231])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][233] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][234] ([Intel XE#2887]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][235] -> [INCOMPLETE][236] ([Intel XE#1727] / [Intel XE#3124])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][238] ([Intel XE#455] / [Intel XE#787])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][239] ([Intel XE#2252]) -> [SKIP][240] ([Intel XE#3007])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][241] ([Intel XE#3007]) -> [SKIP][242] ([Intel XE#2252]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2423] / [i915#2575]) -> [SKIP][244] ([Intel XE#373])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][245] ([Intel XE#1178]) -> [SKIP][246] ([Intel XE#2341]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_content_protection@legacy.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][247] ([Intel XE#2341]) -> [FAIL][248] ([Intel XE#1178])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_content_protection@srm.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][249] ([Intel XE#2320]) -> [SKIP][250] ([Intel XE#3007])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][251] ([Intel XE#3007]) -> [SKIP][252] ([Intel XE#2320])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][253] ([Intel XE#2291]) -> [DMESG-WARN][254] ([Intel XE#877])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][255] ([Intel XE#2425]) -> [DMESG-WARN][256] ([Intel XE#877])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][257] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][258] ([Intel XE#2244])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_dsc@dsc-basic.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_dsc@dsc-basic.html
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2351]) -> [SKIP][260] ([Intel XE#455])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_dsc@dsc-basic.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][261] ([Intel XE#2244]) -> [SKIP][262] ([Intel XE#2136] / [Intel XE#2231])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][263] ([Intel XE#3007]) -> [FAIL][264] ([Intel XE#2882] / [Intel XE#3820])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][265] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][266] ([Intel XE#2293] / [Intel XE#2380])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][268] ([Intel XE#455])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][269] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][270] ([Intel XE#2311]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#2311]) -> [SKIP][272] ([Intel XE#2312]) +13 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][273] ([Intel XE#2312]) -> [SKIP][274] ([Intel XE#2311]) +15 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][275] ([Intel XE#2333]) -> [SKIP][276] ([Intel XE#2136] / [Intel XE#2231])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][277] ([Intel XE#2333]) -> [SKIP][278] ([Intel XE#2312]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][279] ([Intel XE#2312]) -> [FAIL][280] ([Intel XE#2333]) +4 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][282] ([Intel XE#2333]) +1 other test fail
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136]) -> [SKIP][284] ([Intel XE#651]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][285] ([Intel XE#2311]) -> [SKIP][286] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][288] ([Intel XE#651]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][289] ([Intel XE#2313]) -> [SKIP][290] ([Intel XE#2312]) +10 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#653]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][293] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][294] ([Intel XE#2312]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][295] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][296] ([Intel XE#2313]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][298] ([Intel XE#653])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][299] ([Intel XE#2313]) -> [SKIP][300] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][301] ([Intel XE#2312]) -> [SKIP][302] ([Intel XE#2313]) +16 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][303] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][304] ([Intel XE#3544])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][305] ([Intel XE#3007]) -> [SKIP][306] ([Intel XE#2493])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][307] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][308] ([Intel XE#870])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][310] ([Intel XE#908])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          [SKIP][311] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][312] ([Intel XE#1430])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][313] ([Intel XE#1489]) -> [SKIP][314] ([Intel XE#2136] / [Intel XE#2231])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][315] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][316] ([Intel XE#1489]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#1489]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][319] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][320] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-bmg:          [SKIP][323] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][324] ([Intel XE#2136] / [Intel XE#2231])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_psr@fbc-psr-no-drrs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136]) -> [SKIP][326] ([Intel XE#2850] / [Intel XE#929])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][327] ([Intel XE#2426]) -> [FAIL][328] ([Intel XE#1729])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][329] ([Intel XE#3007]) -> [SKIP][330] ([Intel XE#2426])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#362])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][333] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][334] ([Intel XE#3007])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1130]) -> [SKIP][336] ([Intel XE#1123])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][337] ([Intel XE#1130]) -> [SKIP][338] ([Intel XE#2905]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_eudebug@basic-read-event.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1130]) -> [SKIP][340] ([Intel XE#2905]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          [SKIP][341] ([Intel XE#1130]) -> [SKIP][342] ([Intel XE#2322]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1130]) -> [SKIP][344] ([Intel XE#1392])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1130]) -> [SKIP][346] ([Intel XE#288]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1130]) -> [SKIP][350] ([Intel XE#2284] / [Intel XE#366])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#2284])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1130]) -> [ABORT][354] ([Intel XE#1358])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3937
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8191 -> IGT_8192
  * Linux: xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09 -> xe-pw-143557v1

  IGT_8191: b8395f7e32e23c9e330e9d90d85f3f3a1dd08bda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8192: a3b85ce819b99284bef57aafc7d44f50a62e097f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09: 72400937e76c02ae6345f0dfa5a598f0b284ab09
  xe-pw-143557v1: 143557v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/index.html

--===============7428684980045829775==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix sort order of .o lists in Makefile</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143557/">https://patchwork.freedesktop.org/series/143557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09_full -&gt; xe-pw-143557v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143557v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143557v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143557v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143557v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +12 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-c-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3937">Intel XE#3937</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048">Intel XE#4048</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_lease@lease-uevent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_lease@lease-uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-8/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-5/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-5/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-434/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_query@query-invalid-extension.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@xe_query@query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@fbdev@unaligned-read.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +4 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_color@degamma.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_evict@evict-beng-large-cm.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-5/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-464/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8191 -&gt; IGT_8192</li>
<li>Linux: xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09 -&gt; xe-pw-143557v1</li>
</ul>
<p>IGT_8191: b8395f7e32e23c9e330e9d90d85f3f3a1dd08bda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8192: a3b85ce819b99284bef57aafc7d44f50a62e097f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09: 72400937e76c02ae6345f0dfa5a598f0b284ab09<br />
  xe-pw-143557v1: 143557v1</p>

</body>
</html>

--===============7428684980045829775==--
