Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A801C369BD
	for <intel-xe@archiver.kernel.org>; Sat, 19 Apr 2025 04:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0010E439;
	Sat, 19 Apr 2025 04:23:46 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29CF10E436;
 Sat, 19 Apr 2025 04:23:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3869955885142677828=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/gsc=3A_test_new_GSC?=
 =?utf-8?q?_104=2E0=2E5=2E1429_for_LNL_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Apr 2025 04:23:44 -0000
Message-ID: <174503662491.18833.3010776130877743615@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
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

--===============3869955885142677828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: test new GSC 104.0.5.1429 for LNL (rev3)
URL   : https://patchwork.freedesktop.org/series/147859/
State : failure

== Summary ==

CI Bug Log - changes from xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d_FULL -> xe-pw-147859v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147859v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147859v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147859v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  
#### Warnings ####

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#455]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  
Known issues
------------

  Here are the changes found in xe-pw-147859v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#4543]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#4543]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +129 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#2705] / [Intel XE#4212])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2320]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2286])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#309]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2291])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#4667])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#4302])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_display_modes@extended-mode-basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2244])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#776])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#702])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_feature_discovery@display-2x.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2316])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#3321]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#310]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#2882]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#3321])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#301])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][61] -> [INCOMPLETE][62] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2293] / [Intel XE#2380])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2293])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][65] -> [FAIL][66] ([Intel XE#1874])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#651]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#656]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4141]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#656]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2312]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#653]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#653]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#455]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#3012])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#3012])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2486])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#4596])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-x.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2493])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#836])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1489])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1489])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1489]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2850] / [Intel XE#929])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#3414])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#455]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2413]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][97] -> [FAIL][98] ([Intel XE#2883]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-2/igt@kms_setmode@basic.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][99] ([Intel XE#4212])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2168])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1499])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#261] / [Intel XE#688])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2322]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1392])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1392]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#288]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#288]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-adlp:         [PASS][109] -> [DMESG-WARN][110] ([Intel XE#4173]) +4 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2541] / [Intel XE#3573])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@xe_oa@disabled-read-error.html
    - shard-bmg:          NOTRUN -> [FAIL][112] ([Intel XE#4809])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@enable-disable@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][113] ([Intel XE#4804]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_oa@enable-disable@ccs-0.html
    - shard-lnl:          NOTRUN -> [FAIL][114] ([Intel XE#4804])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-2/igt@xe_oa@enable-disable@ccs-0.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][115] -> [ABORT][116] ([Intel XE#1794]) +1 other test abort
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-3/igt@xe_pm@s4-basic.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#4817]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-6/igt@xe_pmu@gt-frequency.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4733])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#4733]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#944])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#4130])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [DMESG-WARN][123] ([Intel XE#4173]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-6/igt@core_hotunplug@hotunplug-rescan.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][125] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][127] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#4212]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][131] ([Intel XE#2291]) -> [PASS][132] +5 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#309]) -> [PASS][134] +2 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][135] ([Intel XE#1475]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#3009]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_dp_aux_dev.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#301]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#310]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][143] ([Intel XE#2316]) -> [PASS][144] +8 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][145] ([Intel XE#2882]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][147] ([Intel XE#886]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][149] ([Intel XE#3321]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][151] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][153] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][155] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][157] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [FAIL][159] ([Intel XE#3098]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#656]) -> [PASS][162] +5 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][163] ([Intel XE#1503]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_hdr@static-swap.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][165] ([Intel XE#3012]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [DMESG-WARN][167] ([Intel XE#3428]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4596]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][171] ([Intel XE#1435]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1392]) -> [PASS][174] +4 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][175] ([Intel XE#1794]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#787]) -> [SKIP][178] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][180] ([Intel XE#787]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][182] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#455]) -> [FAIL][184] ([Intel XE#1178]) +1 other test fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_content_protection@legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][185] ([Intel XE#1178]) -> [SKIP][186] ([Intel XE#2341])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][187] ([Intel XE#3321]) -> [SKIP][188] ([Intel XE#2316])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][189] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][190] ([Intel XE#301])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#4173]) -> [DMESG-FAIL][192] ([Intel XE#4543])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#2311]) +18 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][195] ([Intel XE#2312]) -> [SKIP][196] ([Intel XE#4141]) +8 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][197] ([Intel XE#4141]) -> [SKIP][198] ([Intel XE#2312]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][199] ([Intel XE#2311]) -> [SKIP][200] ([Intel XE#2312]) +10 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#656]) -> [SKIP][202] ([Intel XE#651]) +12 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#651]) -> [SKIP][204] ([Intel XE#656]) +12 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][205] ([Intel XE#2313]) -> [SKIP][206] ([Intel XE#2312]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#653]) -> [SKIP][208] ([Intel XE#656]) +10 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2313]) +20 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#656]) -> [SKIP][212] ([Intel XE#653]) +15 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][213] ([Intel XE#4596]) -> [SKIP][214] ([Intel XE#2493])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#455]) -> [SKIP][216] ([Intel XE#4596])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][217] ([Intel XE#4760]) -> [ABORT][218] ([Intel XE#2705] / [Intel XE#4760])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][219] ([Intel XE#4760]) -> [ABORT][220] ([Intel XE#4502] / [Intel XE#4760])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][221] ([Intel XE#1729]) -> [SKIP][222] ([Intel XE#362])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1500]) -> [SKIP][224] ([Intel XE#362])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [DMESG-WARN][242], [PASS][243], [PASS][244], [PASS][245], [SKIP][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [SKIP][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276]) ([Intel XE#2457])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-7/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-7/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
  [Intel XE#4809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4809
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d -> xe-pw-147859v3

  IGT_8328: 8328
  xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d: d161139329a7bc9d9659a73b965292d036c97e9d
  xe-pw-147859v3: 147859v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/index.html

--===============3869955885142677828==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: test new GSC 104.0.5.1429 for LN=
L (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147859/">https://patchwork.freedesktop.org/series/147859/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147859v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147859v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2973-d161139329a7bc9d9659a73b965292d03=
6c97e9d_FULL -&gt; xe-pw-147859v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147859v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147859v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1478=
59v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_eudebug@read-metadata.html=
">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_eudebug_online@writes-cac=
hing-sram-bb-sram-target-vram.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@invalid-clone-single-crtc-stealing:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg=
2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">ABORT</a></l=
i>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147859v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-8/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-8/igt@=
kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/s=
hard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +129 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_content_protection@atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@kms_content_protection@atom=
ic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_cursor_crc@cursor-random-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_cur=
sor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_di=
splay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_display=
_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_feature_disc=
overy@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard=
-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_fl=
ip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel X=
E#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@kms_flip=
@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_flip@flip-vs-=
blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vbla=
nk@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-4/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard=
-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests=
 skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_hdr@static-swap.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_joiner@basic-force-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_pl=
ane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_plane_multiple=
@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_pm=
_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_pm_rpm@mod=
eset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_scaling_modes@scaling-m=
ode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-2/igt@kms_set=
mode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147859v3/shard-adlp-4/igt@kms_setmode@basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel=
 XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_evict@evict-beng-large-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_exec_fault_mode@twice-use=
rptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-1/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3=
/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_=
probe_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@xe_oa@disabled-read-error.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_oa@disabled-read-error.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4809">Intel XE#4809</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_oa@enable-disable@ccs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-lnl-2/igt@xe_oa@enable-disable@ccs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-3/igt@xe_pm@s=
4-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147859v3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1=
794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-6/igt@xe_pmu@g=
t-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147859v3/shard-lnl-5/igt@xe_pmu@gt-frequency.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817">Int=
el XE#4817</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-6/igt@core_ho=
tunplug@hotunplug-rescan.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-3/i=
gt@core_hotunplug@hotunplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147859v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-466/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4=
212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47859v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434=
/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/sha=
rd-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-432/igt@kms_dp_aux_dev.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard=
-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_fl=
ip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-=
dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg=
-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +8 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
59v3/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hd=
mi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-6/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-5/igt@kms_f=
lip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg=
-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg=
2-434/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3=
/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/=
shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@kms_flip=
@modeset-vs-vblank-race-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg=
-3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859=
v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-=
blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shar=
d-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@k=
ms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-=
dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147859v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_co=
ntent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-434/igt@kms_con=
tent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-lnl-4=
/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-adlp-3/=
igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147859v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47859v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7859v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7859v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
859v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/=
shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
859v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47859v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
59v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-433/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/igt@kms_p=
lane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_pl=
ane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-464/=
igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#=
4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3=
/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4502">Intel XE#4502</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/s=
hard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c9=
7e9d/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d0=
36c97e9d/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b9652=
92d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b=
965292d036c97e9d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659=
a73b965292d036c97e9d/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d=
9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7=
bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d1611393=
29a7bc9d9659a73b965292d036c97e9d/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161=
139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2973-=
d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-4/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bmg-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shard-bm=
g-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d/=
shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d036c97=
e9d/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2973-d161139329a7bc9d9659a73b965292d03=
6c97e9d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel =
XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-6/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147859v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147859v3/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147859v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147859v3/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147859v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d -&gt; xe-pw-147=
859v3</li>
</ul>
<p>IGT_8328: 8328<br />
  xe-2973-d161139329a7bc9d9659a73b965292d036c97e9d: d161139329a7bc9d9659a73=
b965292d036c97e9d<br />
  xe-pw-147859v3: 147859v3</p>

</body>
</html>

--===============3869955885142677828==--
