Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA474C02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 06:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E38F10E434;
	Thu,  6 Feb 2025 06:42:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4745A10E160;
 Thu,  6 Feb 2025 06:42:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3309403015415379185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Compute_as=5Fsdp_when_vrr_?=
 =?utf-8?q?is_enabled_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 06:42:08 -0000
Message-ID: <173882412827.1878514.11995539623501535744@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206045001.2919360-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250206045001.2919360-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============3309403015415379185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Compute as_sdp when vrr is enabled (rev2)
URL   : https://patchwork.freedesktop.org/series/144308/
State : failure

== Summary ==

CI Bug Log - changes from xe-2607-7a632b6798b6a05b63725249e3209afea13ea499_full -> xe-pw-144308v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144308v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144308v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144308v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@core_getversion@all-cards.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-144308v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@fbdev@pan.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#4208] / [i915#2575]) +37 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#827]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#873])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][11] ([Intel XE#4172]) +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#1033]) +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +76 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-bmg:          [PASS][30] -> [INCOMPLETE][31] ([Intel XE#3226])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#877])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1508])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([i915#3804])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2372])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#301]) +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#2882]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][44] -> [FAIL][45] ([Intel XE#3321])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#3321]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@nonexisting-fb@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1033]) +3 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@kms_flip@nonexisting-fb@a-hdmi-a6.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-463/igt@kms_flip@nonexisting-fb@a-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#886])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2311]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4141])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#4208]) +130 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2352])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4208] / [i915#2575]) +54 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_lease@invalid-create-leases.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2486])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [PASS][61] -> [DMESG-WARN][62] ([Intel XE#4173]) +2 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2763]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2938])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1439] / [Intel XE#836])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1489])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2387])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2351] / [Intel XE#4208]) +20 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#3414] / [Intel XE#3904])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1435])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#899]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][75] ([Intel XE#1033]) +7 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2504])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2322]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2905]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#1192])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#4172]) +6 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#4208]) +95 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_prime_self_import@basic-with_fd_dup.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#944])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#2134]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@fbdev@eof.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@fbdev@eof.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][88] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#4208] / [i915#2575]) -> [PASS][91] +53 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-bmg:          [INCOMPLETE][92] ([Intel XE#3226]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][94] ([Intel XE#2291]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][96] ([Intel XE#2425]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][98] ([Intel XE#1340]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#886]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][102] ([Intel XE#2316]) -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][104] ([Intel XE#886]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][107] +7 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][108] ([Intel XE#3012]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [DMESG-WARN][110] ([Intel XE#4172]) -> [PASS][111] +11 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [DMESG-WARN][112] ([Intel XE#4173]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-4/igt@kms_pm_rpm@i2c.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][114] ([Intel XE#2953]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-3/igt@kms_pm_rpm@legacy-planes.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-2/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#4208]) -> [PASS][117] +133 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [DMESG-WARN][118] ([Intel XE#1033]) -> [PASS][119] +4 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [SKIP][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145]) ([Intel XE#378]) -> ([PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-463/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-463/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][170] -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@many-reload.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#4208] / [i915#2575]) -> [SKIP][173] ([Intel XE#873])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#316]) -> [SKIP][175] ([Intel XE#2351] / [Intel XE#4208])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][176] ([Intel XE#1033]) -> [SKIP][177] ([Intel XE#4208]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2351] / [Intel XE#4208]) -> [DMESG-WARN][179] ([Intel XE#1033])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][181] ([Intel XE#316])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#4208]) -> [SKIP][183] ([Intel XE#316])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#316]) -> [SKIP][185] ([Intel XE#4208])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][187] ([Intel XE#1124])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#610]) -> [SKIP][189] ([Intel XE#4208])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1124]) -> [SKIP][191] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#4208]) -> [SKIP][193] ([Intel XE#1124]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1124]) -> [SKIP][195] ([Intel XE#4208])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#2191]) -> [SKIP][197] ([Intel XE#4208] / [i915#2575])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#4208] / [i915#2575]) -> [SKIP][199] ([Intel XE#2191])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#367]) -> [SKIP][201] ([Intel XE#4208] / [i915#2575])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#4208] / [i915#2575]) -> [SKIP][203] ([Intel XE#367])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][205] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][207] ([Intel XE#4208]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#4208]) -> [DMESG-WARN][209] ([Intel XE#1033]) +5 other tests dmesg-warn
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#4208]) -> [SKIP][211] ([Intel XE#2907])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208]) -> [SKIP][213] ([Intel XE#3442])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][214] ([Intel XE#3862]) -> [SKIP][215] ([Intel XE#4208])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#4208]) -> [SKIP][217] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208] / [i915#2575]) -> [SKIP][219] ([Intel XE#306])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_chamelium_color@ctm-max.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#306]) -> [SKIP][221] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#373]) -> [SKIP][223] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208] / [i915#2575]) -> [SKIP][225] ([Intel XE#373]) +6 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4208] / [i915#2575]) -> [FAIL][227] ([Intel XE#1178])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_content_protection@legacy.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#308]) -> [SKIP][229] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [DMESG-WARN][230] ([Intel XE#1033]) -> [SKIP][231] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-dg2-set2:     [INCOMPLETE][232] -> [SKIP][233] ([Intel XE#4208] / [i915#2575])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_cursor_crc@cursor-random-64x64.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#4208] / [i915#2575]) -> [DMESG-WARN][235] ([Intel XE#1033]) +6 other tests dmesg-warn
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-128x128.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-128x128.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#323]) -> [SKIP][237] ([Intel XE#4208] / [i915#2575])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#4208] / [i915#2575]) -> [SKIP][239] ([Intel XE#323])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#4208]) -> [SKIP][241] ([Intel XE#455]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][243] ([Intel XE#455]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#4208] / [i915#2575]) -> [SKIP][245] ([Intel XE#701])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_feature_discovery@chamelium.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1135]) -> [SKIP][247] ([Intel XE#4208] / [i915#2575])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#4208] / [i915#2575]) -> [FAIL][249] ([Intel XE#301])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [SKIP][250] ([Intel XE#2316]) -> [DMESG-WARN][251] ([Intel XE#4172])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][252] ([Intel XE#3149] / [Intel XE#886]) -> [FAIL][253] ([Intel XE#886])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#455]) -> [SKIP][255] ([Intel XE#4208])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][256] ([Intel XE#2312]) -> [SKIP][257] ([Intel XE#2311]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#4208]) -> [SKIP][259] ([Intel XE#651]) +14 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][261] ([Intel XE#651]) +6 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][262] ([Intel XE#1861]) -> [DMESG-FAIL][263] ([Intel XE#1033])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][264] ([Intel XE#4141]) -> [SKIP][265] ([Intel XE#2312]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][266] ([Intel XE#2312]) -> [SKIP][267] ([Intel XE#4141]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][269] ([Intel XE#658])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#651]) -> [SKIP][271] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][272] ([Intel XE#2311]) -> [SKIP][273] ([Intel XE#2312]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#651]) -> [SKIP][275] ([Intel XE#4208]) +9 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#4208]) -> [SKIP][277] ([Intel XE#653]) +14 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#653]) -> [SKIP][279] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#653]) -> [SKIP][281] ([Intel XE#4208]) +10 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][283] ([Intel XE#653]) +6 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][284] ([Intel XE#2313]) -> [SKIP][285] ([Intel XE#2312]) +8 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][286] ([Intel XE#2312]) -> [SKIP][287] ([Intel XE#2313]) +10 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#455]) -> [SKIP][289] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_hdr@brightness-with-hdr.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          [SKIP][290] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][291] ([Intel XE#3544])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2925]) -> [SKIP][293] ([Intel XE#4208])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#4208] / [i915#2575]) -> [SKIP][295] ([Intel XE#356])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208] / [i915#2575]) -> [SKIP][297] ([Intel XE#455]) +6 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_panel_fitting@legacy.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][299] ([Intel XE#4208] / [i915#2575])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#4208] / [i915#2575]) -> [SKIP][301] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#4208]) -> [SKIP][303] ([Intel XE#2938])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#4208]) -> [SKIP][305] ([Intel XE#870])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_pm_backlight@fade.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1122]) -> [SKIP][307] ([Intel XE#2351] / [Intel XE#4208])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#1129]) -> [SKIP][309] ([Intel XE#2351] / [Intel XE#4208])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][310] ([Intel XE#3325]) -> [SKIP][311] ([Intel XE#734])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1489]) -> [SKIP][313] ([Intel XE#4208]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#4208]) -> [SKIP][315] ([Intel XE#1489]) +5 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#4208]) -> [SKIP][317] ([Intel XE#1122])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#1122]) -> [SKIP][319] ([Intel XE#4208])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#4208]) -> [SKIP][321] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][323] ([Intel XE#4208]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][325] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][327] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4208] / [i915#2575]) -> [SKIP][329] ([Intel XE#3414]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#3414]) -> [SKIP][331] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][332] ([Intel XE#1729]) -> [SKIP][333] ([Intel XE#2426])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][334] ([Intel XE#2426]) -> [SKIP][335] ([Intel XE#2509])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#1500]) -> [SKIP][337] ([Intel XE#4208] / [i915#2575])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#4208] / [i915#2575]) -> [SKIP][339] ([Intel XE#330])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#4208] / [i915#2575]) -> [SKIP][341] ([Intel XE#756]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][343] ([Intel XE#4208] / [i915#2575])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#4208]) -> [SKIP][345] ([Intel XE#1123]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#4208]) -> [SKIP][347] ([Intel XE#944]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_create@multigpu-create-massive-size.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#2905]) -> [SKIP][349] ([Intel XE#4208]) +8 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_eudebug@basic-close.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#4208]) -> [SKIP][351] ([Intel XE#2905]) +9 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#4208]) -> [SKIP][353] ([Intel XE#288]) +18 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#288]) -> [SKIP][355] ([Intel XE#4208]) +12 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][356] ([Intel XE#2833]) -> [SKIP][357] ([Intel XE#1192])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#4208]) -> [SKIP][359] ([Intel XE#560])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_media_fill@media-fill.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][361] ([Intel XE#4208]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#4208]) -> [SKIP][363] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#4208]) -> [SKIP][365] ([Intel XE#977])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][366] ([Intel XE#1173]) -> [SKIP][367] ([Intel XE#1061] / [Intel XE#4208])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_peer2peer@read.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][369] ([Intel XE#4208])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_pm@d3cold-basic.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#4208]) -> [DMESG-WARN][371] ([Intel XE#1033] / [Intel XE#569])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@s3-basic.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][372] ([Intel XE#4172] / [Intel XE#569]) -> [INCOMPLETE][373] ([Intel XE#1358] / [Intel XE#569])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][374] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][375] ([Intel XE#4208])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#4208]) -> [SKIP][377] ([Intel XE#2284] / [Intel XE#366])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#4208]) -> [ABORT][379] ([Intel XE#1033] / [Intel XE#1358])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#4208]) -> [ABORT][381] ([Intel XE#1358])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#944]) -> [SKIP][383] ([Intel XE#4208])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#4130]) -> [SKIP][385] ([Intel XE#4208])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
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
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
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
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2607-7a632b6798b6a05b63725249e3209afea13ea499 -> xe-pw-144308v2

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2607-7a632b6798b6a05b63725249e3209afea13ea499: 7a632b6798b6a05b63725249e3209afea13ea499
  xe-pw-144308v2: 144308v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/index.html

--===============3309403015415379185==
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
<tr><td><b>Series:</b></td><td>Compute as_sdp when vrr is enabled (rev2)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144308/">https://patchwork.freedesktop.org/series/144308/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144308v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144308v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2607-7a632b6798b6a05b63725249e3209afea=
13ea499_full -&gt; xe-pw-144308v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144308v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144308v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1443=
08v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@core_getversion@all-car=
ds.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-3/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-2/i=
gt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html">DMESG-WARN</a>=
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144308v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@fbdev@pan.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel X=
E#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ad=
dfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_addf=
b_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@kms_async_f=
lips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_atomic_interruptible@lega=
cy-setmode@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/sha=
rd-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_chamelium_color@ctm-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_content_protection@lega=
cy@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/ig=
t@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Int=
el XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_cursor_=
legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired=
-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@kms_flip@flip-vs-expi=
red-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vbla=
nk@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@kms_fl=
ip@nonexisting-fb@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-463/igt@kms_flip@nonexi=
sting-fb@a-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-4/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_flip@wf_vblank=
-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
c-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +130 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_lease@invalid-create-le=
ases.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-3/igt@kms_pip=
e_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-2/igt@kms_pipe_crc_ba=
sic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-pl=
ane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-1/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_vblank@ts-continuation-=
dpms-suspend@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_exec_sip_eudebug@breakpoin=
t-waitsip-heavy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@xe_live_=
ktest@xe_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@xe_oa@mm=
io-triggered-reports.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@xe_oa@mmio-triggered-rep=
orts.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4172">Intel XE#4172</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_pri=
me_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_prime_s=
elf_import@basic-with_fd_dup.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +95 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144308v2/shard-bmg-7/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@fbdev@=
eof.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@fbdev@eof.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144308v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1443=
08v2/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">PAS=
S</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg=
-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-b=
mg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_fl=
ip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@km=
s_flip@2x-plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-=
bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-4/igt@kms_flip=
@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/igt@kms_fl=
ip@wf_vblank-ts-check@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-pri-indfb-draw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-4/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-7/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel X=
E#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144308v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-rotation.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-4/igt@kms_pm_=
rpm@i2c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-3/igt@kms_pm_rpm@i2c.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-3/igt@kms_pm_=
rpm@legacy-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-2/igt@kms_pm=
_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_evi=
ct_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4308v2/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfr=
ee-reopen.html">PASS</a> +133 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_exe=
c_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard=
-dg2-466/igt@xe_exec_threads@threads-bal-mixed-userptr.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499=
/shard-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea1=
3ea499/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e320=
9afea13ea499/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725=
249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05=
b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b679=
8b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a6=
32b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-26=
07-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13e=
a499/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209a=
fea13ea499/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249=
e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63=
725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6=
a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b=
6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-=
7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144308v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-46=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4308v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/sh=
ard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144308v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44308v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-=
464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144308v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_mod=
ule_load@many-reload.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_module_load@many-re=
load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shar=
d-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms=
_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_bi=
g_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/=
igt@kms_big_fb@linear-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bi=
g_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shar=
d-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shar=
d-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bi=
g_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@k=
ms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@km=
s_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/sha=
rd-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2=
/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1443=
08v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144308v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144308v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-46=
4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_bw=
@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1443=
08v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308=
v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14430=
8v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v=
2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shar=
d-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">In=
tel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2=
-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#344=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/=
shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-=
435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-4=
34/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_chameli=
um_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ch=
amelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-46=
4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ch=
amelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144308v2/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_co=
ntent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2=
-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/=
igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-=
464/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-random-64x64.html">INCOMPLETE</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_curs=
or_crc@cursor-random-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-sliding-128x128.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/s=
hard-dg2-435/igt@kms_cursor_crc@cursor-sliding-128x128.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/=
shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_dsc@dsc-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-=
435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fe=
ature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-d=
g2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shar=
d-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/igt@kms_flip@2x=
-flip-vs-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-lnl-4/igt@kms_flip=
@wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-lnl-7/ig=
t@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144308v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144308v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1443=
08v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip=
-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v=
2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/s=
hard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#65=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
308v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1443=
08v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144308v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_hd=
r@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_hdr@b=
rightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other test=
s skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-d=
g2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44308v2/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_pa=
nel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/=
igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
308v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_pm=
_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@kms_pm_backli=
ght@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_=
pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-adlp-4/igt@kms_pm_dc@dc9-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144308v2/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144308v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@kms_p=
sr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ps=
r@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@k=
ms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ps=
r@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@=
kms_psr@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ps=
r@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg=
2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#92=
9</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard=
-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-d=
g2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-2/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/s=
hard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg=
2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2=
-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/sh=
ard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_cre=
ate@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/=
igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/=
igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-=
dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_media_f=
ill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v=
2/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_oa@=
syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_oa@s=
yncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-434/igt@xe_pat@pat-ind=
ex-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_p=
m@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@=
s3-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_pm@s3-basic.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-bmg-4/igt@xe_pm@s3=
-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-bmg-6=
/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-=
464/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@=
s4-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-435/igt@xe_pm@s4=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@=
s4-vm-bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-436/igt@xe_pm@s4-=
vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-464/igt@xe_pm@=
s4-vm-bind-unbind-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-466/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-463/igt@xe_que=
ry@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144308v2/shard-dg2-464/igt@xe_qu=
ery@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE=
#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144308v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2607-7a632b6798b6a05b63725249e3209afea13ea499 -&gt; xe-pw-144=
308v2</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2607-7a632b6798b6a05b63725249e3209afea13ea499: 7a632b6798b6a05b6372524=
9e3209afea13ea499<br />
  xe-pw-144308v2: 144308v2</p>

</body>
</html>

--===============3309403015415379185==--
