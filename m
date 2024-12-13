Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14A1E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 13:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1E410F00E;
	Fri, 13 Dec 2024 13:59:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD9B10E43C;
 Fri, 13 Dec 2024 13:59:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7849307819035926628=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PSR_DSB_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 13:59:03 -0000
Message-ID: <173409834323.2160989.9241404991595724093@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213063528.2759659-1-jouni.hogander@intel.com>
In-Reply-To: <20241213063528.2759659-1-jouni.hogander@intel.com>
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

--===============7849307819035926628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PSR DSB support
URL   : https://patchwork.freedesktop.org/series/142521/
State : failure

== Summary ==

CI Bug Log - changes from xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3_full -> xe-pw-142521v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142521v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142521v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142521v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_flip@bo-too-big-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
    - shard-lnl:          [PASS][7] -> [DMESG-WARN][8] +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-3/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-1/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][11] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-142521v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1125])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#1033] / [Intel XE#1727])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][16] ([Intel XE#3781])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_async_flips@crc@pipe-a-dp-2.html

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][17] ([Intel XE#1727] / [Intel XE#3468])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_atomic_interruptible@atomic-setmode@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1231])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +61 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#787]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2907])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2907])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-FAIL][32] ([Intel XE#1727]) +1 other test dmesg-fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#314]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1152]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-5.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms@pipe-a-dp-5.html

  * igt@kms_content_protection@type1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#455]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][41] ([Intel XE#3468]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][42] ([Intel XE#2705] / [Intel XE#3468])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#309]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2932]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#1340])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#3321]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#310]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][57] ([Intel XE#3468]) +7 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#301]) +3 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#2882]) +2 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2953] / [Intel XE#3086]) +5 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1397] / [Intel XE#1745])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1397])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#656]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1861])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#651]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#653]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#656]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#653]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][73] ([Intel XE#3468])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3086]) +6 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][76] ([Intel XE#3468]) +3 other tests dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#361])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [PASS][79] -> [DMESG-WARN][80] ([Intel XE#877]) +1 other test dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#2763]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1489]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1489]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [PASS][85] -> [TIMEOUT][86] ([Intel XE#1727]) +7 other tests timeout
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1122])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1127])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1435]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#899])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#1522]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-1/igt@kms_vrr@max-min.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-8/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#756])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][99] -> [INCOMPLETE][100] ([Intel XE#1727] / [Intel XE#3468])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@suspend-resume.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][101] -> [DMESG-WARN][102] ([Intel XE#3468]) +18 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][103] -> [DMESG-FAIL][104] ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1123])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2905]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2905])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_balancer@once-parallel-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][109] ([Intel XE#1727])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1392]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#288]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#288]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][113] -> [DMESG-WARN][114] ([Intel XE#3467]) +2 other tests dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1337])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][118] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][119] -> [ABORT][120] ([Intel XE#1607] / [Intel XE#1794])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][121] -> [ABORT][122] ([Intel XE#1794])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#958])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#944])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#944])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][127] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3818]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][129] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#324]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][133] -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [PASS][136] +4 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][137] ([Intel XE#3321]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][139] ([Intel XE#2882]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][141] ([Intel XE#2316]) -> [PASS][142] +3 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][143] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [FAIL][145] ([Intel XE#886]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [DMESG-WARN][147] ([Intel XE#1727]) -> [PASS][148] +4 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#361]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][151] ([Intel XE#1430]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [FAIL][153] ([Intel XE#3609]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][155] ([Intel XE#3468]) -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [SKIP][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182]) ([Intel XE#378]) -> ([PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-2/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-2/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-3/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-9/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-9/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-4/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][208] ([Intel XE#3086]) -> [PASS][209] +6 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][210] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][212] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][214] ([Intel XE#958]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [DMESG-FAIL][216] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3818]) -> [DMESG-WARN][217] ([Intel XE#3818]) +1 other test dmesg-warn
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-bmg:          [DMESG-WARN][218] ([Intel XE#3468]) -> [DMESG-WARN][219] ([Intel XE#1727] / [Intel XE#3468])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_atomic_interruptible@atomic-setmode.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][220] ([Intel XE#3468]) -> [DMESG-WARN][221] ([Intel XE#3468]) +4 other tests dmesg-warn
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#2705]) -> [DMESG-WARN][223] ([Intel XE#3468])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][224] ([Intel XE#1178]) -> [SKIP][225] ([Intel XE#2341]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_content_protection@atomic.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-bmg:          [DMESG-WARN][226] ([Intel XE#3468]) -> [DMESG-FAIL][227] ([Intel XE#3468]) +2 other tests dmesg-fail
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][228] ([Intel XE#3468]) -> [DMESG-WARN][229] ([Intel XE#877])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][230] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][231] ([Intel XE#3468])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][232] ([Intel XE#2291]) -> [DMESG-WARN][233] ([Intel XE#3468]) +1 other test dmesg-warn
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][234] ([Intel XE#2882]) -> [SKIP][235] ([Intel XE#2316])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][236] ([Intel XE#2312]) -> [SKIP][237] ([Intel XE#2311]) +15 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][238] ([Intel XE#2312]) -> [DMESG-FAIL][239] ([Intel XE#3468])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][240] ([Intel XE#2333]) -> [SKIP][241] ([Intel XE#2312]) +9 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][242] ([Intel XE#2312]) -> [FAIL][243] ([Intel XE#2333]) +6 other tests fail
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][244] ([Intel XE#2311]) -> [SKIP][245] ([Intel XE#2312]) +20 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][246] ([Intel XE#2312]) -> [SKIP][247] ([Intel XE#2313]) +11 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][248] ([Intel XE#2313]) -> [SKIP][249] ([Intel XE#2312]) +16 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [DMESG-WARN][250] ([Intel XE#3468]) -> [DMESG-FAIL][251] ([Intel XE#2705] / [Intel XE#3468])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][252] ([Intel XE#3544]) -> [SKIP][253] ([Intel XE#3374] / [Intel XE#3544])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][254] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][255] ([Intel XE#3468]) +1 other test dmesg-warn
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [DMESG-WARN][256] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][257] ([Intel XE#1727] / [Intel XE#3468])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-436/igt@kms_pm_rpm@cursor-dpms.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [ABORT][258] ([Intel XE#3468]) -> [DMESG-WARN][259] ([Intel XE#1727] / [Intel XE#3468])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#362]) -> [FAIL][261] ([Intel XE#1729])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1500]) -> [SKIP][263] ([Intel XE#362])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-dg2-set2:     [DMESG-WARN][264] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][265] ([Intel XE#3468]) +2 other tests dmesg-warn
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-466/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][266] ([Intel XE#1473]) -> [INCOMPLETE][267] ([Intel XE#1473] / [Intel XE#3468])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [FAIL][268] ([Intel XE#1000]) -> [INCOMPLETE][269] ([Intel XE#1473])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [FAIL][270] ([Intel XE#1000]) -> [TIMEOUT][271] ([Intel XE#1473])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-bmg:          [DMESG-WARN][272] ([Intel XE#3468]) -> [DMESG-WARN][273] ([Intel XE#1473] / [Intel XE#3468]) +1 other test dmesg-warn
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-8/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [FAIL][274] ([Intel XE#1000]) -> [TIMEOUT][275] ([Intel XE#1473] / [Intel XE#2472])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][276] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][277] ([Intel XE#3343])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [DMESG-WARN][278] ([Intel XE#3467]) -> [DMESG-WARN][279] ([Intel XE#3467] / [Intel XE#3468])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [DMESG-WARN][280] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][281] ([Intel XE#3467])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2284] / [Intel XE#366]) -> [INCOMPLETE][283] ([Intel XE#3468])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3609
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3 -> xe-pw-142521v1

  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be46262724a61ae951e3
  xe-pw-142521v1: 142521v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/index.html

--===============7849307819035926628==
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
<tr><td><b>Series:</b></td><td>PSR DSB support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142521/">https://patchwork.freedesktop.org/series/142521/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142521v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142521v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2368-a4502e763bb931b68fa9be46262724a61=
ae951e3_full -&gt; xe-pw-142521v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142521v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142521v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1425=
21v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-433/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_flip=
@bo-too-big-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-7/igt@kms_flip@bo-too-big=
-interruptible.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl=
-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">IN=
COMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-3/igt@kms_psr@=
fbc-psr-cursor-blt@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-1/igt@kms_psr@fbc-psr-curs=
or-blt@edp-1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@s=
uspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-=
bmg-2/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:<u=
l>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_async_flips@alternate-s=
ync-async-flip-atomic@pipe-b-hdmi-a-1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142521v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp=
-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_async_flips@crc@pipe-a-dp=
-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3781">Intel XE#3781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_atomic_interruptible@atom=
ic-setmode@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +61 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-ba=
sic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-c=
rc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-fr=
ame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_content_protection@type1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_cursor_crc@cursor-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-=
top-bottom@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-435/igt@kms_cu=
rsor_legacy@torture-bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-436/igt@kms_cursor_legacy@to=
rture-bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2932">Intel XE#2932</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@b-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_flip@flip-v=
s-expired-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pi=
pe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@kms_pip=
e_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_pipe_crc_ba=
sic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +6 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-=
read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-436/igt@=
kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
521v1/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping=
-pixel-formats@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/sha=
rd-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully=
-sf.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1727">Intel XE#1727</a>) +7 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@kms_psr@psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-1/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-8/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-1/igt@kms_vrr@=
max-min.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142521v1/shard-lnl-8/igt@kms_vrr@max-min.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#15=
22</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@kms_writeback@writeback-che=
ck-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@s=
uspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@xe_ccs@suspend-resume.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-=
bmg-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3468">Intel XE#3468</a>) +18 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_ccs@s=
uspend-resume@xmajor-compressed-compfmt0-system-vram01.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-=
bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_eudebug_online@breakpoin=
t-many-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_eudebug_online@pagefault-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_evict@evict-beng-large-mu=
lti-vm-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_exec_balancer@once-paral=
lel-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_exec_fault_mode@once-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@xe_fault=
_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/sh=
ard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_=
ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3467">Intel XE#3467</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@xe_oa@invalid-map-oa-buffer.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-6/igt@xe_pm_re=
sidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-4/igt@xe_pm_residency@toggle-g=
t-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_query@multigpu-query-inva=
lid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v1/shard-dg2-466/igt@xe_query@multigpu-query-mem=
-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3818">Intel XE#3818</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_async_fli=
ps@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142521v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-asy=
nc-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">=
Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142521v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip=
-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DMESG-WARN</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1=
/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdm=
i-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-5/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +4 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142521v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-7/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-ln=
l-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142521v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-=
32bpp-xtile-downscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/sh=
ard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-2/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@kms_pm_r=
pm@basic-pci-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3609">Intel XE#3609</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-4/igt@kms_pm_rp=
m@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@xe_exec_=
threads@threads-mixed-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
521v1/shard-bmg-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebin=
d.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e=
3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61a=
e951e3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be4626272=
4a61ae951e3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46=
262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa=
9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931=
b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763=
bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a450=
2e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368=
-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-1/igt@xe_module_l=
oad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e=
3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46262724a61a=
e951e3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be4626272=
4a61ae951e3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa9be46=
262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931b68fa=
9be46262724a61ae951e3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2368-a4502e763bb931=
b68fa9be46262724a61ae951e3/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142521v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142521v1/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/sh=
ard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142521v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142521v1/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521=
v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42521v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142521v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shar=
d-adlp-2/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-1/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard=
-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-lnl-2/igt@xe_pm@s4=
-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-lnl-7/ig=
t@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-8/igt@xe_pm_r=
esidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@xe_pm_resi=
dency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3818">Intel XE#3818</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142521v1/shard-adlp-2/igt@kms_async_flips@alternate-syn=
c-async-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3818">Intel XE#3818</a>) +1 other test dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_atom=
ic_interruptible@atomic-setmode.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg=
-3/igt@kms_atomic_interruptible@atomic-setmode.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142521v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@=
pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142521v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-=
ccs@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_curs=
or_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg=
-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">=
Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142521v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142521v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2521v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
521v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_hdr@=
bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@kms_hd=
r@bpc-switch-suspend.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-463/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142521v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pi=
pe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-436/igt@kms_pm=
_rpm@cursor-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-=
466/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-434/igt@kms_pm=
_rpm@dpms-mode-unset-lpsp.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-463/igt@km=
s_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-464/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-466/igt@kms_vb=
lank@ts-continuation-modeset-rpm.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
521v1/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-3/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-b=
mg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel=
 XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/ig=
t@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-7/igt@xe_evict=
@evict-beng-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_ev=
ict@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-5/igt@xe_evict=
@evict-cm-threads-large-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bm=
g-8/igt@xe_evict@evict-cm-threads-large-multi-vm.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1=
473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-4/igt@xe_evict=
@evict-mixed-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-bmg-3/igt@xe_e=
vict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Inte=
l XE#3343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142521v1/shard-bmg-6/igt@xe_fault_injection@inject-fault=
-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-6/igt@xe_fault=
_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Int=
el XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142521v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-functi=
on-xe_pm_init_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-bmg-2/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142521v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_up=
date_ops_run.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3/shard-dg2-464/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v1/shard-dg2-434/igt@=
xe_pm@d3cold-mmap-vram.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3 -&gt; xe-pw-142=
521v1</li>
</ul>
<p>IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be4=
6262724a61ae951e3<br />
  xe-pw-142521v1: 142521v1</p>

</body>
</html>

--===============7849307819035926628==--
